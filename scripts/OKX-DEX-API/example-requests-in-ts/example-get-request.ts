// Required dependencies: axios, crypto (Node.js built-in)

import axios, { AxiosRequestConfig } from 'axios';
import crypto from 'crypto';

import * as dotenv from 'dotenv';
dotenv.config();

const apiKey = process.env.API_KEY || '';
const secretKey = process.env.SECRET_KEY || '';
const passphrase = process.env.PASS_PHRASE || '';
const baseUrl = 'https://www.okx.com';

// @dev - Successfully loaded environment variables
console.log(`API_KEY: ${ process.env.API_KEY }`);
console.log(`SECRET_KEY: ${ process.env.SECRET_KEY }`);
console.log(`PASS_PHRASE: ${ process.env.PASS_PHRASE }`);


// Function to generate signature
function generateSignature(timestamp: string, method: string, requestPath: string, body: string, secretKey: string): string {
  const message = timestamp + method + requestPath + body;
  return crypto.createHmac('sha256', secretKey).update(message).digest('base64');
}

// Main request function
async function makeRequest() {
  const method = 'GET';
  const requestPath = '/api/v5/account/balance';
  const body = ''; // For GET requests, body should be empty string
  const timestamp = new Date().toISOString();

  const signature = generateSignature(timestamp, method, requestPath, body, secretKey);
  console.log(`signature: ${ signature }`); // @dev - [Log]: Successfully generated signature

  const headers: Record<string, string> = {
    'OK-ACCESS-KEY': apiKey,
    'OK-ACCESS-SIGN': signature,
    'OK-ACCESS-TIMESTAMP': timestamp,
    'OK-ACCESS-PASSPHRASE': passphrase,
    'Content-Type': 'application/json',
  };
  console.log(`headers: ${ JSON.stringify(headers, null, 2) }`); // @dev - [Log]: Successfully generated headers

  const config: AxiosRequestConfig = {
    method,
    url: `${baseUrl}${requestPath}`,
    headers,
  };
  console.log(`config: ${ JSON.stringify(config, null, 2) }`); // @dev - [Log]: 

  try {
    const response = await axios(config);
    console.log('Response:', response.data);
  } catch (error) {
    console.error('Error:', error);
  }
}

// Execute the request
makeRequest();
