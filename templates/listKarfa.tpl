{% extends "index.html" %}
{% block content %}
<div class="karfaGrid">
    <ol>
        {% for index in karfa %}
            <ul>
                <p>{{ vorur[index][1] }}</p>
            </ul>
        {% endfor %}
    </ol>
    <ol>
        {% for index in karfa %}
            <ul><p>{{ vorur[index][3] }} kr.</p></ul>
        {% endfor %}
    </ol>
</div>
{% endblock %}