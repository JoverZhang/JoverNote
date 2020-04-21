# Deploy environment for TypeScript

## Data from

+ [juejin](https://juejin.im/post/5a8fff275188257a5a4cc7d9)
+ [gitbook](https://rexdainiel.gitbooks.io/typescript/content/docs/quick/nodejs.html)

## Base environment for TypeScript

```bash
yarn init
yarn add typescript
tsc --init
```

## Install plugins for TypeScript

```bash
yarn add --save @types/node
yarn add --save-dev typescript
```

If you use "npm" or "yarn", can add the following lines to your `PROJECTPATH/package.json`

```json
"dependencies": {
  "@types/lodash": "^4.14.138",
  "nodemon": "^1.19.1",
  "ts-node": "^8.3.0",
  "typescript": "^3.6.2"
},
"scripts": {
  "start": "yarn run build:live",
  "build:live": "nodemon --exec ./node_modules/.bin/ts-node -- ./index.ts"
}
```
