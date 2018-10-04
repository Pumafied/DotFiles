
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



test_variables = ["username","password","date","description"]
test_kinds = ["string","string","date","boolean"]
test_isinit = [True,True,False,True]
"""
print(gen_model_main("User", "users", test_variables, test_kinds, test_isinit))
"""
# --------------------------- Gen HTML ----------------------------
# Auto gen 3 route types Html
# Types of data, text area, text label, file, checkbox
# Disregard the kinds for now
# Warning this doest change the button properly
# Eventually colors should be modifiable from this
def add_item(model_name, variables, kinds):
	#Do actual changes here
	generated_string = ""
	generated_string += head_backend(model_name)
	for variable in variables:
		generated_string += """
						<div class="input-field col s9 offset-s1">
							<input name="{0}" id="{0}" type="text" value="{{{{{0}}}}}">
							<label for="{0}">{0}</label>
						</div>""".format(variable)

	generated_string += tail_backend()

	return generated_string

# Head Stuff
def head_backend(model_name):
	generated_string = """
<!DOCTYPE html>
<html>
	<head>
		<!--Import Google Icon Font-->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<!--Import materialize.css-->
		<link type="text/css" rel="stylesheet" href="/css/materialize.min.css"  media="screen,projection"/>
		<link type="text/css" rel="stylesheet" href="/css/style.css"  media="screen,projection"/>

		<!--Let browser know website is optimized for mobile-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	</head>
	<title>Add {0}</title>
	<body>
		{{% include 'nav.html' %}}

		<div class="container">
			<div class="row">
				<div class="col s8 offset-s2 box">
					<h3>Add {0}</h3>
					<p>{{{{status}}}}
					</p>
					<form method="post" action="#">
""".format(model_name)
	return generated_string


# Tail Stuff
def tail_backend():
	generated_string = """
						<center><input class="waves-effect waves-light btn" type="submit" value="Add name"></center>
					</form>
				</div>
				</form>
			</div>
		</div>
		</div>
	</body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

	<script type="text/javascript" src="/js/materialize.min.js"></script>
	<script>
		$( document ).ready(function(){
			$(".button-collapse").sideNav();
		})

	</script>
	{{% include 'activate.html' %}}
</html>
"""
	return generated_string

# this deals with editing of a particular model
# Item name is the name of the variable that is being passed from flask
def edit_item(model_name, variables, kinds, item_name):
	#Do actual changes here
	generated_string = ""
	generated_string += head_backend(model_name)
	for variable in variables:
		generated_string += """
						<div class="input-field col s9 offset-s1">
							<input name="{0}" id="{0}" type="text" value="{{{{{1}.{0}}}}}">
							<label for="{0}">{0}</label>
						</div>""".format(variable, item_name)

	generated_string += tail_backend()

	return generated_string


# --------------------------- End Gen HTML ----------------------------
# --------------------------- Generate Routes for application.py ----------------------------
# This handles creating a new instance of the object
def edit_item_route(current_item, variables, model_name):
	# Do header info
	# do object editing
	generated_string = """
@app.route('/edit_{0}/<int:current>', methods=['GET','POST'])
@login_required
def edit_{0}():
	status = ''
	{0} = {1}.query.get(current)
	if request.method == 'POST':
""".format(current_item, model_name)

	# Need to make sure this goes to the right indent level
	generated_string += "\n\t\t# Grab data from form\n"
	for variable in variables:
		generated_string += "\t\t" + request(variable)
	generated_string += "\n\t\t# Update Object\n"
	for variable in variables:
		generated_string += "\t\t" + request_cont(variable, current_item)
	# Session commit
	generated_string += "\t\tdb.session.commit()\n"
	# TODO: add the redirect
	# Do template return
	generated_string += "\treturn render_template('name.html', status=status)\n"

	return generated_string

# This handles the edit route for the item
# this handler will be less than perfect if the person fails the check the data will be reset
def add_item_route(current_item, variables, model_name):
	generated_string =""
	generated_string = """
@app.route('/add_{0}', methods=['GET','POST'])
@app.route('/add_{0}.html', methods=['GET','POST'])
@login_required
def add_{0}():
	status = ''
	if request.method == 'POST':
""".format(current_item, model_name)

	# Need to make sure this goes to the right indent level
	generated_string += "\n\t\t# Grab data from form\n"
	for variable in variables:
		generated_string += "\t\t" + request(variable)
	generated_string += "\n\t\t# Create Object\n"



	generated_string += "\n\t\t# Create Object\n"


	# TODO: add the redirect
	# Do template return
	generated_string += "\treturn render_template('name.html', status=status)\n"

	return generated_string
	# Do header info
	# Do post inormation
	# Do template return

	# Do checks on the blanks for everything. You can edit this out manually

	return generated_string


# --------------------------- End Generate Routes for application.py ----------------------------

# Gen Nav
# Auto gen model helper
# Auto gen route types python

# print(edit_item("User", test_variables, "","current_album"))
print(edit_item_route("current", test_variables, "User"))
