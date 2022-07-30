# pip install beautifulsoup4
# pip install requests
# pip install lxml
import requests
from bs4 import BeautifulSoup


def parser_wiki():
    """Wikipedia site parser for a list of animals"""

    animals_lst = []
    url = 'https://ru.wikipedia.org/wiki/Категория:Животные_по_алфавиту'

    while True:
        page = requests.get(url).text
        soup = BeautifulSoup(page, 'lxml')
        animals = soup.find('div', class_="mw-category-columns").find_all("a")
        next_page = soup.find('div', id='mw-pages').find_all('a')  # Finding the address of the next page

        """Parsed the data and added in to animals_lst[]"""
        for animal in animals:
            animals_lst.append(animal.text)

        """Write new link in url"""
        for link in next_page:
            if link.text == 'Следующая страница':
                url = 'https://ru.wikipedia.org' + link.get('href')

        """Exit from the loop when we find the last element"""
        if animals_lst[-1] == 'Zyzzyx chilensis':  # Last element in wiki
            break

    return animals_lst


print(parser_wiki())
