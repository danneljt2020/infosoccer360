import requests

import json

headers = {
    'x-rapidapi-host': "livescore-football.p.rapidapi.com",
    'x-rapidapi-key': "143ad21dc7mshde30eecc97d4ce3p1d03efjsn40a1fec30a14"
}

base_url = "https://livescore-football.p.rapidapi.com/soccer/"


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


# Get matches by date
def get_matches_league_by_date(date, league_code):
    querystring = {"date": date, "league_code": league_code}
    try:
        response = requests.request("GET", base_url + "matches-by-date", headers=headers, params=querystring)
        matches = response.json()['data'][0]['matches']
    except requests.exceptions.RequestException as e:
        return {}
    return matches


# Get match by id
def get_matches_by_id(match_id):
    querystring = {"match_id": match_id}
    try:
        response = requests.request("GET", base_url + "match-statistics", headers=headers, params=querystring)
        matches = response.json()['data']
    except requests.exceptions.RequestException as e:
        return {}
    return matches


# response = get_matches_by_date("20220213", "laliga-santander")
# write_data("matches_by_date.json", response.json())

