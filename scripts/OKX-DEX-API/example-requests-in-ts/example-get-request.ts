// Required dependencies: axios, crypto (Node.js built-in)

import axios, { AxiosRequestConfig } from 'axios';
import crypto from 'crypto';

const apiKey = 'your_api_key';
const secretKey = 'your_secret_key';
const passphrase = 'your_passphrase';
const baseUrl = 'https://www.okx.com';

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

  const headers: Record<string, string> = {
    'OK-ACCESS-KEY': apiKey,
    'OK-ACCESS-SIGN': signature,
    'OK-ACCESS-TIMESTAMP': timestamp,
    'OK-ACCESS-PASSPHRASE': passphrase,
    'Content-Type': 'application/json',
  };

  const config: AxiosRequestConfig = {
    method,
    url: `${baseUrl}${requestPath}`,
    headers,
  };

  try {
    const response = await axios(config);
    console.log('Response:', response.data);
  } catch (error) {
    console.error('Error:', error);
  }
}

// Execute the request
makeRequest();
