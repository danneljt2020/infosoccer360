from datetime import datetime

import requests

import json

headers = {
    'x-rapidapi-host': "livescore-football.p.rapidapi.com",
    'x-rapidapi-key': "143ad21dc7mshde30eecc97d4ce3p1d03efjsn40a1fec30a14"
}

base_url = "https://livescore-football.p.rapidapi.com/soccer/"


# Future games OK
# url = "https://livescore-football.p.rapidapi.com/soccer/matches-by-date"
#
# querystring = {"date": "20220212", "league_code": "laliga-santander", "country_code": "spain"}
#
# headers = {
#     'x-rapidapi-host': "livescore-football.p.rapidapi.com",
#     'x-rapidapi-key': "143ad21dc7mshde30eecc97d4ce3p1d03efjsn40a1fec30a14"
# }
#
# response = requests.request("GET", url, headers=headers, params=querystring)


# read the json file
def get_data(json_file):
    with open(json_file, encoding="utf8") as file:
        return json.load(file)


# write the json file
def write_data(json_file, data_json):
    with open(json_file, mode="w", encoding="utf8") as file:
        json.dump(data_json, file, ensure_ascii=False, indent=4)


# Get table score by league and country OK
def get_table_by_league(country_code, league_code):
    querystring = {"country_code": country_code, "league_code": league_code}
    try:
        response = requests.request("GET", base_url + "league-table", headers=headers, params=querystring)
        table_score = response.json()['data']['total']
    except requests.exceptions.RequestException as e:
        return {}

    return table_score


# Get matches by league ok
def get_matches_by_league(country_code, league_code, round):
    querystring = {"country_code": country_code, "league_code": league_code, "round": round}
    try:
        response = requests.request("GET", base_url + "matches-by-league", headers=headers, params=querystring)
        matches = response.json()['data']
    except requests.exceptions.RequestException as e:
        return {}

    return matches



# print(get_matches_by_league("spain", "laliga-santander", "25"))
# write_data("matches_by_league.json", response.json())

