# Network and API Challenge - Byte Coin project

This app was an interesting experience in order to practice the knowledge that I have been learned previously, particulary the topic is a nice one because I actually love learning about cryptocurrency prices and conversions among the currencies.

## Technical information
If you want to do some tests or changes, you could be following the steps below to generator an api key.

API site reference: https://www.coinapi.io 
In order to get your api key you need: Go to Pricing menu -> Free option -> Click on Get a free API key button

Request example
```bash
GET https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=<<yout-api-key>>
```

Response example
```bash
{
  "time": "2023-09-06T01:17:22.0000000Z",
  "asset_id_base": "BTC",
  "asset_id_quote": "USD",
  "rate": 25795.494560414313455707380756
}
```