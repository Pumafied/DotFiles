


# Model CSV
# variable, kind, isinit
# Route CSV
# class, create, edit, delete








# ------------------------ Model Helpers ------------------------

# Generates each individual class Indent still off by one
def gen_model_main(model, table, names, kinds, isinit):
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
def add_item_route(current_item, variables):
	generated_string =""
	generated_string = """
@app.route('/add_{0}', methods=['GET','POST'])
@app.route('/add_{0}.html', methods=['GET','POST'])
@login_required
def add_{0}():
	status = ''
	if request.method == 'POST':
""".format(current_item)

	# Need to make sure this goes to the right indent level
	generated_string += "\n\t\t# Grab data from form\n"
	for variable in variables:
		generated_string += "\t\t" + request(variable)
	generated_string += "\n\t\t# Create Object\n"

	generated_string += "\t\tnew_{0} = create_{0}(".format(current_item)
	#TODO: Change this to use only the ones that are going to be in the init
	for variable in variables:
		generated_string += variable
		if variable != len(variables) - 1:
			generated_string += ", "

	generated_string += ")\n"

	# TODO: add the redirect
	# Do template return
	generated_string += "\treturn render_template('name.html', status=status)\n"

	return generated_string


#TODO: List Items Stub
def list_items():
	generated_string = ""
	return generated_string


def delete_item_route(current_name,model_name):
	generated_string = ""
"""
@app.route('/confirm_delete/<int:current>', methods=['GET','POST'])
@login_required
def confirm_delete_{1}(current=''):
	status = ''
	{1}= {0}.query.get(current)
	db.session.delete({1})
	db.session.commit()

	return redirect('/name')
""".format(current_name, model_name)
	return generated_string

# generates the route for application.py to ensure they mean to delete the item
def delete_item_confirm_route():
	generated_string = """
@app.route('/delete/<int:band_id>', methods=['GET','POST'])
@login_required
def delete_{}(band_id=''):
	status = ''
	{0} = {0}.query.get(band_id)

	return render_template("{1}.html")
""".format(current_item, current_model)
	return generated_string


# Generates the confirm delete html template
# TODO: This
def delete_item_confirm_html():
	generated_string = ""
	# Head

	# Main
	# Tail
	return generated_string



# --------------------------- End Generate Routes for application.py ----------------------------

# TODO: Gen delete confirm
# TODO: Gen delete confirm HTML
# TODO: Gen delete route
# TODO: Gen Nav
# TODO: Auto gen model helper
# TODO: Auto gen route types python
# TODO: Runner Model
# TODO: Runner Routes
# TODO: Runner Model Helpers
# TODO: Full Run from CSV
# TODO: Generate WSGI
# TODO: Auto run env
# TODO: gen logout
# TODO: gen login

def gen_app():
	# Generate Heading stub
	generated_string = app_head()
	#TODO: Gen Routes management

	generated_string = app_mid()
	# Gen Model


	# End Stuff
	generated_string = app_tail()
	return generated_string

def app_mid():
	generate_string = """

# Login
@app.route('/login', methods=['GET','POST'])
@app.route('/login.html', methods=['GET','POST'])
@app.route('/signin', methods=['GET','POST'])
@app.route('/signin.html', methods=['GET','POST'])
def login():
	if request.method == 'GET' :
		return render_template('login.html')

	# otherwise attempt to log in
	email = request.form["email"]
	password = request.form["password"]

	user = User.query.filter_by(email=email).first()
	if user != None :
		if pbkdf2_sha256.verify(password, user.password) :
			user.authenticated = True
			db.session.commit()
			login_user(user)
			return redirect("/users")

	status = "Incorrect Username or Password"
	return render_template("login.html", status = status)


@app.route('/logout.html', methods=['GET'])
@app.route('/logout', methods=['GET'])
@app.route('/signout.html', methods=['GET'])
@app.route('/signout', methods=['GET'])
def logout():
	print("Called: logout")

	logout_user()
	return redirect("/")


@loginmanager.user_loader
def load_user(id):
	users = User.query.filter_by(id=id)
	login_user = users.first()
	login_user.authenticated = True
	db.session.commit()
	return login_user

"""
	return generated_string

def app_head():
	generated_string = """
# -*- coding: utf-8 -*-
from flask import *
from logging.handlers import RotatingFileHandler
from flask_assets import Environment, Bundle
from flask.ext.login import LoginManager, login_user, logout_user, current_user, login_required
from passlib.hash import pbkdf2_sha256
import logging
from model import db, User, GlobalSettings, Band, Album, Contact
import perform
from flask_webpack import Webpack
import os

app = Flask(__name__)
#TODO: The niceness if they fuck up on the add form
#TODO: Confirm Deletes
# current = model.Shift.query.filter_by(id=shift).first()

loginmanager = LoginManager()
loginmanager.init_app(app)
loginmanager.login_view = '/'
app.static_folder = 'static'


app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///raven.db'

app.config['DEBUG'] = True
app.config['PROPAGATE_EXCEPTIONS'] = True
app.config['TRAP_BAD_REQUEST_ERRORS'] = True
db.app = app
db.init_app(app)

	company = Company.query.get(company)
	company.poc_title = poc_title
def allowed_file(filename):
	return '.' in filename and \
		filename.rsplit('.',  1)[1] in ALLOWED_EXTENSIONS

# Taken out to remove the possibility of sending emails accidentally
def send_async_email(app, msg):
	with app.app_context():
		mail.send(msg)
"""
	return generated_string


def app_tail():
	generated_string = """
@app.route('/js/<remainder>', methods=['GET'])
@app.route('/img/<remainder>', methods=['GET'])
@app.route('/images/<remainder>', methods=['GET'])
@app.route('/css/<remainder>', methods=['GET'])
@app.route('/vendor/<remainder>', methods=['GET'])
@app.route('/fonts/<remainder>', methods=['GET'])
@app.route('/band_data/<remainder>', methods=['GET'])
def get_static(remainder):
	return send_from_directory(app.static_folder, request.path[1:])

# Change before launch
app.secret_key = "0446698678"

# #  Example Logging
if __name__ == "__main__":
	handler = RotatingFileHandler('log.log', maxBytes=10000000, backupCount=1)
	handler.setLevel(logging.INFO)
	app.logger.addHandler(handler)
	app.run(host="0.0.0.0", port=8080)

"""
	return generated_string

