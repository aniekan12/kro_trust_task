final mockLoginReponse = {
  'access_token': 'eyhshsh92992002jsjsjsss',
  'user_name': 'ani',
  'id': '939300',
  'savings_balance': 100,
  'checkings_balance': 200,
};

final nullMockLoginReponse = {
  'access_token': null,
  'user_name': null,
  'id': null,
  'savings_balance': null,
  'checkings_balance': null,
};

final mockTransactionResponse = {
  "data": [
    {
      "date": "2024-05-01",
      "description": "Opening balance",
      "amount": "-",
      "type": "Opening",
      "balance": "₦5,000.00"
    },
  ]
};

final mockTransferResponse = {
  "amount": "100.00",
  "message": "Transfer successful",
  "description": "Funds have been successfully transferred to the recipient.",
  "recepient": "John Doe"
};
