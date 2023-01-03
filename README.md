# ipfs_nft

This contract has a totalSupply parameter that limits the number of images that can be added to the contract. The addImage function is called to add a new image to the contract and store its IPFS hash and metadata. The getImage function can be called to retrieve the IPFS hash and metadata for a specific image.

To connect to IPFS and add an image, you will need to use a library like js-ipfs-api or js-ipfs-http-client. Here is an example of how you might use js-ipfs-api in a JavaScript file to add an image to IPFS and then add the image to the contract:

'''const IPFS = require('ipfs-api');
const ipfs = new IPFS({ host: 'ipfs.infura.io', port: 5001,
'''
