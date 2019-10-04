from flask import Flask, render_template, session, url_for, request, redirect
from os import urandom

app = Flask(__name__)
app.secret_key = urandom(24)

vorur = [
	[0, 'Gigabyte GeForce GT 710 skjákort 2GB GDDR5', 'Gt710.jpg', '11.990'],		 
	[1, 'Gigabyte Radeon 5700XT skjákort 8GB GDDR6', 'R6700.jpg', '89.990'],
	[2, 'Gigabyte GeForce GT 1030 Silent skjákort 2GB GDDR5', 'Gt1030.jpg', '16.990'],
	[3, 'Gigabyte GeForce GTX 1650 OC skjákort 4GB GDDR5', 'Gt1650.jpg', '32.990'],
	[4, 'Gigabyte GeForce RTX 2070 Gaming skjákort 8GB GDDR6', 'Rt2070.jpg', '79.992'],
	[5, 'Gigabyte Aorus GeForce RTX 2080 Ti Waterblock skjákort 11GB GDDR6', 'Rt2080ti.jpg', '269.990'],
	[6, 'Zotac Gaming GeForce RTX 2060 Super skjákort 8GB GDDR6', 'Rt2060.jpg', '72.990'],
	[7, 'Zotac Gaming GeForce GTX 1660 skjákort 6GB GDDR5', 'Gt1660.jpg', '31.992'],
	[8, 'Gigabyte GeForce RTX 2070 Super Gaming OC skjákort 8GB GRRD6', 'Rt2070s.jpg', '99.990']
]

@app.route("/")
def home():
	if 'karfa' not in session:
		session['karfa'] = []
	return render_template('vara.tpl', vorur=vorur, lengd=len(vorur), fjoldi=len(session['karfa']))

@app.route("/karfa", methods=['POST', 'GET'])
def karfa():
	cart, samtals = session['karfa'], 0
	
	for index in cart:
		samtals += int(vorur[index][3].replace('.', ''))
	
	new = ""
	for index, tala in enumerate(str(samtals)[::-1]):
		if (index+1) % 3 == 0 and index+1 != len(str(samtals)):
			new += tala
			new += '.'
		else:
			new += tala
	samtals = new[::-1]

	if request.method == 'POST':
			session['nafn'] = request.form.get('nafn')
			session['heimilisfang'] = request.form.get('heimilisfang')
			session['tolvupostur'] = request.form.get('tolvupostur')
			session['simanumer'] = request.form.get('simanumer')
			session['karfa'] = []

			return render_template('order.tpl', nafn=session['nafn'], heimilisfang=session['heimilisfang'], tolvupostur=session['tolvupostur'], simanumer=session['simanumer'], samtals=samtals, cart=cart, vorur=vorur)


	if len(cart) == 0:
		return "<h1> Karfan er Tóm </h1>"
	else:
		return render_template('listKarfa.tpl', karfa=cart, vorur=vorur, samtals=samtals)

	

@app.route("/add/<int:index>")
def vara(index):
	cart = session['karfa']
	cart.append(index)
	session['karfa'] = cart
	return redirect(url_for('home'))

@app.route("/delete/<int:index>")
def delete(index):
	cart = session['karfa']
	cart.pop(index)
	session['karfa'] = cart
	return redirect(url_for('karfa'))

@app.errorhandler(404)
def error(error):
	return render_template('error.tpl')

if __name__ == '__main__':
	app.run(debug=True)