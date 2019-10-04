{% extends "index.html" %}
{% block content %}
<h3>{{ nafn }}, þín pöntun hefur verið staðfest.</h3>
<div class="order">
    <ol>
        <ul>Heimilisfang:</ul>
        <ul>Tölvupóstur:</ul>
        <ul>Símanúmer:</ul>
        {% for index in cart %}
            <ul>{{ vorur[index][1] }}</ul>
        {% endfor %}
        <ul>Samtals:</ul>
    </ol>
    <ol>
        <ul>{{ heimilisfang }}</ul>
        <ul>{{ tolvupostur }}</ul>
        <ul>{{ simanumer }}</ul>
        {% for index in cart %}
            <ul>{{ vorur[index][3] }}</ul>
        {% endfor %}
        <ul>{{ samtals }}</ul>
    </ol>
</div>
<a href="{{ url_for('home') }}">Back<a>
{% endblock %}