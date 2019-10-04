{% extends "index.html" %}
{% block content %}
<a href="{{url_for('home')}}">Home</a>
<div class="karfaGrid">
    <ol>
        {% for index in karfa %}
            <ul>
                <p>{{ vorur[index][1] }}</p>
            </ul>
        {% endfor %}
        <ul><p>Samtals</p></ul>
    </ol>
    <ol>
        {% for index in karfa %}
            <ul><p>{{ vorur[index][3] }} kr.</p></ul>
        {% endfor %}
        <ul><p>{{ samtals }} kr.</p></ul>
    </ol>
    <ol>
        {% for index in karfa %}
            <ul><p><a href="/delete/{{index}}">x</a></p></ul>
        {% endfor %}
    </ol>
    <ol>

</div>

<form class="Form" method="POST">
    <div>
        <p>Nafn:</p>
        <input type="text" name="nafn" required placeholder="Kári Stefánsson" size="35">
    </div>

    <div>
        <p>Heimilisfang:</p>
        <input type="text" name="heimilisfang" required placeholder="Sogavegi 3">
    </div>

    <div>
        <p>Tölvupóstur:</p>
        <input type="text" name="tolvupostur" required placeholder="KáriS@outlook.com">
    </div>

    <div>
        <p>Símanúmer:</p>
        <input type="text" name="simanumer" required pattern="\d{3}[\-]\d{4}" placeholder="123-4567">
    </div>
    <input type="submit" value="Submit">
</form>
{% endblock %}