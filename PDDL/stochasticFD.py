#AI group project Fall 2018
#Authors: Group 8

from shutil import copyfile
import pyparsing as pp
import os,random

#Change these two constants to change initial domain and problem
DOMAINSTARTFILE = "OldPDDL/domain_all_cost.pddl"
PROBLEMSTARTFILE = "OldPDDL/problem_all_cost.pddl"

TMPFOLDER = "./tmp/"
DOMAINFILE = TMPFOLDER + "domain_current.pddl"
PROBLEMFILE = TMPFOLDER + "problem_current.pddl"
SASPLANFILE = "sas_plan"

path = []

#TODO: Clean and comment
#TODO: Fix indentation to only use tabs

def main():
	os.system("mkdir "+TMPFOLDER)
	copyfile(DOMAINSTARTFILE,DOMAINFILE)
	copyfile(PROBLEMSTARTFILE,PROBLEMFILE)

	runOnce()
	while(getNextMove(SASPLANFILE)[0] != ";"):#";" means that we have arrived at the destination
		print("Move: " + getNextMove(SASPLANFILE))	
		input("press enter")			
		update()
		randomizeWeights(PROBLEMFILE)	
		runOnce()

	print("Final path taken")
	print(path)

def runOnce():
	os.system("python3 FastDownWard/fast-downward.py " + DOMAINFILE + " " + PROBLEMFILE +" --search 'astar(lmcut())'")		

def update():
	#updates the problem file with the effects of the next move
	move = getNextMove(SASPLANFILE)
	path.append(move)
	print("Move:")
	print(move)
	params, parsedEff = getEffects(DOMAINFILE,move)
	delEffs = []
	addEffs = []
	for e in parsedEff:
		if e[0] == 'not':
			delEffs.append(parsedEfftoString(e[1],params))
		else:
			addEffs.append(parsedEfftoString(e,params))		
	print("add:")
	print(addEffs)
	print("del:")
	print(delEffs)
	modifiyInit(PROBLEMFILE,addEffs,delEffs)
	

#-----Modifying Init File------
def modifiyInit(problemFile, addEffs,delEffs):
	#Modifies a the init section of a problem file given a set of effects
	#
	#Parameters:
	# 	problemfile - file name of the problem file
	#	addEffs - effects to add to the problem file
	#	delEffs - effects to delete from the problem file	
	
	#Get problem file data
	f = open(problemFile,"r")
	lines = f.readlines()
	f.close()

	#Open an output file for writing
	outF = open(problemFile,"w")
	
	inInit = 0#0=before init block, 1=in init block, 2=after init block
	for l in lines:
		if inInit == 0:#Search for init block
			if l.find(":init") != -1:
				inInit = 1
		elif inInit == 1:
			for i in range(0,len(delEffs)):
				index = l.find(delEffs[i])
				if (index != -1):
					l = l[:index] + l[index+len(delEffs[i]):] 
					del delEffs[i]
			if l.find("=") != -1:
				for e in addEffs:#Add new effects in init block before path weights
					outF.write(e)
				inInit = 2
		outF.write(l)
	outF.close()

def parsedEfftoString(eff,params):
	#Converts an eff in list fromat into a string with parameter values
	#
	#Params:
	#	Eff - an effect in list format. F.e: ['At', '?p', '?x']
	#	params - a dictionary with parameter values
	#
	#Returns: String version of Eff. F.e "At person a"
	def helper(eff,params):
		if type(eff) == str:
			if eff[0] == "?":#If eff is a variable
				eff = params[eff[1:]]
			return eff

		#Treat eff as a list since it is not a string
		out = ""
		for i in range(0,len(eff)):
			out += helper(eff[i],params)		
			if i != len(eff)-1:
				out += " "
		return out

	return "(" + helper(eff,params) + ")"


#-----Extracting Data-----
def getParams(line):
	#Extracts parameters from a line
	#
	#Parameters:
	#	line - a string containing the substring ":parameters" followed by parameter values
	#	
	#Returns: the parameter values that were obtained
	params = []

	parsed = parseNew(line)
	if (parsed[0] == ":parameters"):
		for i in range(0,len(parsed[1])):
			parsed[1][i] = parsed[1][i].strip("?)\n")
			params.append(parsed[1][i])
	
	return params

def parseNew(line):
	#Utilizes the pyparsing library to convert parenthesises in strings to lists
	#
	#Parameters:
	# 	line - a string to convert to a nested list
	#
	#Returns: Nested list
	parsed = pp.nestedExpr(opener='(', closer=')').parseString("("+str(line)+")")
	parsed = parsed[0]#NestedExpr needed string to start with "("
	return parsed


def getEffects(domainFile,move):
    #Extracts effects from a domain file given a move
    def cleanEff(eff):
        if type(eff) == str:
            if (eff == ":effect" != -1 or eff=="and"):
                return -1
            return eff
        newEff = []
        for e in eff:
            clean = cleanEff(e)
            if clean != -1:
                newEff.append(clean)
                print(clean)
        if len(newEff) == 1:
             newEff = newEff[0]
        return newEff	
        
    domainF = open(domainFile,"r")
    domain = domainF.readlines()
    domainF.close()
    params = {}
    action = move.split(" ")[0]
    paramVals = move.split(" ")[1:]

    found = False
    for line in domain:
        if found:
            #print(line)
            if (line.find("action") != -1):
                break
            if (line.lower().find(":parameters")!=-1):
                parsedParams = getParams(line)
                for i in range(0,len(parsedParams)):
                    params[parsedParams[i]] = paramVals[i]
            if (line.lower().find(":effect")!=-1):
                parsedEff = parseNew(line+")")#add ) since we are not interested in the next line containing the total cost variable
        else:
            if (line.lower().find(":action "+action.lower()) !=-1):
                found = True
    
    return params, cleanEff(parsedEff)


def getNextMove(sas_plan_file):
	sas_plan = open(sas_plan_file,"r")
	line = sas_plan.readline()
	sas_plan.close()
	move = line.strip("() \n")
	return move


#-----Changing edge weights-----
def randomizeWeights(fileName):
	#Randomizes all the numbers in a file
	#TODO fix so that diff from a to b is equal to b to a?
	def helper(text):
		text = text.split(" ")
		for i in range(0,len(text)):
			text[i] = getNextNum(text[i])

		return " ".join(text)
	
	inF = open(fileName,"r")
	problem = inF.read()
	inF.close()	
	newProblem = helper(problem)
		
	out = open(fileName,"w")
	out.write(newProblem)
	out.close()

def getNextNum(text):
    #Substitutes numbers in text with random numbers
    text = text.split(")")
    for i in range(0,len(text)):
        if text[i].isdigit():
            text[i] = str(randUniform(0,1))
    return ")".join(text)

def randUniform(a, b):
    return round(random.uniform(a,b))


if __name__ == "__main__":
    main()
