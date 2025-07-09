/**
 * @notice - ref: https://web3.okx.com/build/dev-docs/dex-api/dex-use-swap-quick-start
 */


// --------------------- npm package ---------------------
//import { Web3 } from 'web3';
import axios from 'axios';
import * as dotenv from 'dotenv';
import CryptoJS from 'crypto-js';


// --------------------- environment variable ---------------------

// Load hidden environment variables
dotenv.config();

// Your wallet information - REPLACE WITH YOUR OWN VALUES
//const WALLET_ADDRESS: string = process.env.EVM_WALLET_ADDRESS || '0xYourWalletAddress';
//const PRIVATE_KEY: string = process.env.EVM_PRIVATE_KEY || 'YourPrivateKey'; 

// Token addresses for swap on Base Chain
const ETH_ADDRESS: string = '0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE'; // Native ETH
const USDC_ADDRESS: string = '0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913'; // USDC on Base

// Chain ID for Base Chain
const chainId: string = '8453';

// API URL
const baseUrl: string = 'https://web3.okx.com/api/v5/';

// Amount to swap in smallest unit (0.0005 ETH)
const SWAP_AMOUNT: string = '500000000000000'; // 0.0005 ETH
const SLIPPAGE: string = '0.005'; // 0.5% slippage tolerance

// --------------------- util function ---------------------

/**
 * @notice - Generate headers for OKX DEX API authentication
 * @param timestamp 
 * @param method 
 * @param requestPath 
 * @param queryString 
 * @returns 
 */
export function getHeaders(timestamp: string, method: string, requestPath: string, queryString = "") {
// Check https://web3.okx.com/zh-hans/web3/build/docs/waas/rest-authentication for api-key
    const apiKey = process.env.OKX_API_KEY;
    const secretKey = process.env.OKX_SECRET_KEY;
    const apiPassphrase = process.env.OKX_API_PASSPHRASE;
    const projectId = process.env.OKX_PROJECT_ID;

    if (!apiKey || !secretKey || !apiPassphrase || !projectId) {
        throw new Error("Missing required environment variables");
    }

    const stringToSign = timestamp + method + requestPath + queryString;
    return {
        "Content-Type": "application/json",
        "OK-ACCESS-KEY": apiKey,
        "OK-ACCESS-SIGN": CryptoJS.enc.Base64.stringify(
            CryptoJS.HmacSHA256(stringToSign, secretKey)
        ),
        "OK-ACCESS-TIMESTAMP": timestamp,
        "OK-ACCESS-PASSPHRASE": apiPassphrase,
        "OK-ACCESS-PROJECT": projectId,
    };
};

/**
 * Get swap quote from DEX API
 * @param fromTokenAddress - Source token address
 * @param toTokenAddress - Destination token address
 * @param amount - Amount to swap
 * @param slippage - Maximum slippage (e.g., "0.005" for 0.5%)
 * @returns Swap quote
 */
async function getSwapQuote(
  fromTokenAddress: string,
  toTokenAddress: string,
  amount: string,
  slippage: string = '0.005'
): Promise<any> {
  try {
    const path = 'dex/aggregator/quote';
    const url = `${baseUrl}${path}`;

    const params = {
      chainId: chainId,
      fromTokenAddress,
      toTokenAddress,
      amount,
      slippage
    };

    // Prepare authentication
    const timestamp = new Date().toISOString();
    const requestPath = `/api/v5/${path}`;
    const queryString = "?" + new URLSearchParams(params).toString();
    const headers = getHeaders(timestamp, 'GET', requestPath, queryString);

    const response = await axios.get(url, { params, headers });

    if (response.data.code === '0') {
      return response.data.data[0];
    } else {
      throw new Error(`API Error: ${response.data.msg || 'Unknown error'}`);
    }
  } catch (error) {
    console.error('Failed to get swap quote:', (error as Error).message);
    throw error;
  }
}

/**
 * @notice - Run this script to test the API request
 */
async function main() {
    const timestamp = new Date().toISOString();
    const method = 'GET';
    const requestPath = '/api/v5/account/balance';
    const headers = getHeaders(timestamp, method, requestPath);
    console.log(`headers: ${JSON.stringify(headers, null, 2)}`); // @dev - [Log]: Successfully generated headers

    // Get swap quote
    const quote = await getSwapQuote(ETH_ADDRESS, USDC_ADDRESS, SWAP_AMOUNT, SLIPPAGE);
    console.log(`Swap Quote: ${JSON.stringify(quote, null, 2)}`); // @dev - [Log]: Successfully fetched swap quote
}

main().catch((error) => {
    console.error('Error:', error);
    process.exit(1);
});
