const https = require('https');
const crypto = require('crypto');
const querystring = require('querystring');

const dotenv = require('dotenv');
dotenv.config();

// Define API credentials
const api_config = {
  "api_key": process.env.API_KEY,
  "secret_key": process.env.SECRET_KEY,
  "passphrase": process.env.PASS_PHRASE,
};

function preHash(timestamp, method, request_path, params) {
  // Create a pre-signature based on strings and parameters
  let query_string = '';
  if (method === 'GET' && params) {
    query_string = '?' + querystring.stringify(params);
  }
  if (method === 'POST' && params) {
    query_string = JSON.stringify(params);
  }
  return timestamp + method + request_path + query_string;
}

function sign(message, secret_key) {
  // Use HMAC-SHA256 to sign the pre-signed string
  const hmac = crypto.createHmac('sha256', secret_key);
  hmac.update(message);
  return hmac.digest('base64');
}

function createSignature(method, request_path, params) {
  // Get the timestamp in ISO 8601 format
  const timestamp = new Date().toISOString().slice(0, -5) + 'Z';
  // Generate a signature
  const message = preHash(timestamp, method, request_path, params);
  const signature = sign(message, api_config['secret_key']);
  return { signature, timestamp };
}

function sendPostRequest(request_path, params) {
  // Generate a signature
  const { signature, timestamp } = createSignature("POST", request_path, params);

  // Generate the request header
  const headers = {
    'OK-ACCESS-KEY': api_config['api_key'],
    'OK-ACCESS-SIGN': signature,
    'OK-ACCESS-TIMESTAMP': timestamp,
    'OK-ACCESS-PASSPHRASE': api_config['passphrase'],
    'Content-Type': 'application/json' 
  };

  const options = {
    hostname: 'web3.okx.com',
    path: request_path,
    method: 'POST',
    headers: headers
  };

  const req = https.request(options, (res) => {
    let data = '';
    res.on('data', (chunk) => {
      data += chunk;
    });
    res.on('end', () => {
      console.log(data);
    });
  });

  if (params) {
    req.write(JSON.stringify(params));
  }

  req.end();
}

/**
 * @notice - Execute a POST request to the OKX DEX API to get the current price of a token.
 */
const postRequestPath = '/api/v5/dex/index/current-price';
const postParams = [{
  chainIndex: "1",
  tokenContractAddress: "0xc18360217d8f7ab5e7c516566761ea12ce7f9d72"
}];
sendPostRequest(postRequestPath, postParams); 
