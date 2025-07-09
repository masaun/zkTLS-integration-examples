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
 * @notice - Run this script to test the API request
 */
const timestamp = new Date().toISOString();
const method = 'GET';
const requestPath = '/api/v5/account/balance';
const headers = getHeaders(timestamp, method, requestPath);
console.log(`headers: ${JSON.stringify(headers, null, 2)}`); // @dev - [Log]: Successfully generated headers

