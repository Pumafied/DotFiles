
# ------------------------ Model Helpers ------------------------

# Generates each individual class Indent still off by one
def gen_model_main(model,table,names, kinds, isinit):
	# Generate the header information for the class
	generated_string = """
class {0}(db.Model):\n\t__tablename__ = '{1}'\n\n\t#  ---Data---\n""".format(model, table)

	# Run everything to get class variables
	generated_string += gen_model_class_variables(names,kinds)


	# This needs to be a filtered list based on whether this variable should be in the init
	# A potential upgrade to the init could be to have a default data file
	filtered_names = []
	count = 0
	for name in names:
		if isinit[count] == True:
			filtered_names.append(str(name))
		# otherwise do nothing
		count +=1

	# Run the init generator with the now filitered varaibles
	generated_string += gen_init_model(filtered_names)

	# Return the completed model
	return generated_string

def gen_model_class_variables(names, kinds):
	print("Ran gen_model_class")
	count = 0
	generated_string = ""
	for name in names:
		generated_string += "\t" + name

		if(kinds[count] == "string"):
			generated_string += " = db.Column(db.String(200))\n"
		elif(kinds[count] == "date"):
			generated_string += " = db.Column(db.DateTime, default=datetime.utcnow)\n"
		elif(kinds[count] == "boolean"):
			generated_string += " = db.Column(db.Boolean())\n"

		count += 1
	return generated_string


# Generate the init section
def gen_init_model(variables):
	# Do start
	generated_string = "\tdef __init__(self, "
	for variable in variables:
		generated_string += variable
		if variable != len(variables) - 1:
			generated_string += ", "

	generated_string += "):\n"
	# Do the meat of the method
	for variable in variables:
		generated_string += "\t\t"+ request_cont(variable, "self")


	return generated_string


# ------------------------ Edit Route Helpers ------------------------

# This is to get the item from the variable before entering to data
def request(variable):
		return('{0} = request.form["{0}"]\n').format(variable)


# This adds the data that we got from the request to the model object that we retireeved
# Variable is the name of the piece of data we are getting. Model is the name of the current item
def request_cont(variable, model):
	return("{1}.{0} = {0}\n").format(variable, model)



"""
test_variables = ["username","password","date","description"]
test_kinds = ["string","string","date","boolean"]
test_isinit = [True,True,False,True]
print(gen_model_main("User", "users", test_variables, test_kinds, test_isinit))
"""

# Auto gen model helper
























# Auto gen 3 route types Html
# Auto gen 3 route types python




























