{% extends "index.html" %}

{% block header %}
<p><a href="{{ url_for('karfa') }}">Karfa - {{ fjoldi }}</a></p>
{% endblock %}

{% block content %}
<div>
    {% for index in range(lengd) %}
        {% if index % 3 ==  0 %}<div class="row">{% endif %}
            <div class="vara">
                <section>
                    <img src="static/{{vorur[index][2]}}" alt="Picture failed.">
                </section>
                <section>
                    <a href="/add/{{vorur[index][0]}}">
                        <p>{{ vorur[index][1] }}</p>
                        <p>{{ vorur[index][3] }} kr.</p>
                    </a>
                </section>
            </div>
        {% if index % 3 ==  2 or index+1 == lengd %}
            </div> 
        {% endif %}
    {% endfor %}
</div>
{% endblock %}