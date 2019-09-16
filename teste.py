import re
import sys
from bs4 import BeautifulSoup

soup = BeautifulSoup(open('aulas.html', 'r', encoding='ISO-8859-1'), 'html.parser')
dia = sys.argv[1]
dia_dot = dia + '.'
table = soup.find(id='formBusca:dataTable:tb')
for row in table.children:
    horario = row.find(id=re.compile('.*id193.*'))
    if dia_dot in horario.text:
        disc = row.find(id=re.compile('.*id148.*')).text
        print(disc)
        split_horarios = horario.text.split('.')
        if len(split_horarios) > 2:
            horarios = [f'{split_horarios[0]}ª {split_horarios[1][0:-1]}']
        else:
            horarios = [f'{split_horarios[0]}ª {split_horarios[1]}']
        for i in range(2, len(split_horarios)):
            horarios.append(f'{split_horarios[i-1][-1]}ª {split_horarios[i]}')
        for h in horarios:
            if h[0] == dia:
                print(h)
        for prof in horario.next_sibling.find_all('a'):
            print(prof.text)
        print()
