# CryptoMart - A NFT Marketplace

## Techstack

1. <b>NextJS</b>

   - `npx create-next-app projectName`
   - Change `package.json` with the `package.json` in this repo to ensure same version of packages get installed
     > Instead of `npm install` run `npm install --legacy-peer-deps`!
   - Run nextJS by `npm run dev`

2. <b> HardHat </b>

   - used to deploy and test blockchain smart contracts

3. <b>Openzeppelin</b>
   - provides utility code to create our contract
4. <b>Axios</b>

   - used to make API request

5. <b>ethers</b>

   - used to interact with blockchain smart contract on client side

6. <b>ipfs http client</b>

   - allow us to deploy our NFTs

7. <b>next-themes</b>

   - library to easily allow us to switch between light and dark theme

8. <b>react-dropzone</b>

   - used to upload files

9. <b>web3modal</b>
   - library to interact with smart contracts on client side

## DevDependencies

> Belo three are used for styling purposes. Tailwind is a classic CSS utility library that allow us to create styles more easily.

1. <b>autoprefixer</b>
2. <b>postcss</b>
3. <b>tailwindcss</b>
   - `npx tailwindcss init -p`
   - [Tailwind Guide for NextJS](-https://tailwindcss.com/docs/guides/nextjs)
4. <b>eslint</b>
   - linting library to make sure we write clean and scalable code
   - helps to find and fix problems in your Javascript code
   - `npx eslint --init`
   - <b>Steps</b>
     1. To check syntax, find problems and enforce code style
     2. Javascript modules (import/export)
     3. React
     4. Does your project use typescript? `No`
     5. Browser
     6. Use a popular style guide
     7. Airbnb
     8. Format - javascript
     9. Install - `Yes`

## Files and Folder structures

1. <b>node_modules</b>

   - contains code for all the pakcages

2. <b>pages</b>

   - contains all our different routes
   - file based routing

3. <b>public</b>

   - assets

4. <b>styles</b>

   - `globals.css`
     - contains basic and global styling

5. <b>tailwind.config.js</b>
6. <b>postcss.config.js</b>

7. <b>.eslintrc.json</b>
