import datetime
from flask import Flask, request, render_template_string

app = Flask(__name__)

template = '''
<!DOCTYPE html>
<html>
<head>
    <title>Hitung Hari Sabtu dan Minggu</title>
</head>
<body>
    <h2>Masukkan Rentang Tanggal</h2>
    <form method="post">
        <label for="start_date">Tanggal Awal:</label>
        <input type="date" id="start_date" name="start_date"><br><br>
        <label for="end_date">Tanggal Akhir:</label>
        <input type="date" id="end_date" name="end_date"><br><br>
        <input type="submit" value="Submit">
    </form>
    {% if result %}
        <h3>Output:</h3>
        <p>Hari Sabtu dan Minggu antara {{ start_date }} dan {{ end_date }}:</p>
        <ul>
        {% for day in result %}
            <li>{{ day }}</li>
        {% endfor %}
        </ul>
    {% endif %}
</body>
</html>
'''

def get_saturdays_and_sundays(start_date, end_date):
    saturdays_and_sundays = []
    current_date = start_date
    while current_date <= end_date:
        if current_date.weekday() in [5, 6]:  # Saturday is 5 and Sunday is 6
            saturdays_and_sundays.append(current_date.strftime('%A, %d %B %Y'))
        current_date += datetime.timedelta(days=1)
    return saturdays_and_sundays

@app.route('/', methods=['GET', 'POST'])
def index():
    result = None
    start_date = None
    end_date = None
    if request.method == 'POST':
        start_date = request.form['start_date']
        end_date = request.form['end_date']
        start_date = datetime.datetime.strptime(start_date, '%Y-%m-%d').date()
        end_date = datetime.datetime.strptime(end_date, '%Y-%m-%d').date()
        result = get_saturdays_and_sundays(start_date, end_date)
    return render_template_string(template, result=result, start_date=start_date, end_date=end_date)

if __name__ == '__main__':
    app.run(debug=True)
