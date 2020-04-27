const express = require('express');
const router = express.Router();

const jsf = require('json-schema-faker');
const util = require('util')
const chance = require('chance')
const faker = require('faker')
jsf.extend('chance', () => new chance.Chance());
jsf.extend('faker', () => faker);

var recentDays = 5;

var schema = {
  "type": "array",
  "minItems": 5,
  "maxItems": 10,
  "items": {
	  "type": "object",
	  "properties": {
	    "name": {
	      "type": "string",
	      "faker": "name.findName"
	    },
	   "email": {
          "type": "string",
          "faker": "internet.email"
        },
	    "tons" : {
	      "type": "integer", 
	       "minimum": 3,
  		   "maximum": 20
	    },
	    "quantity" : {
	      "type": "integer", 
	       "minimum": 0,
  		   "maximum": 16
	    },
	  },
	  "required": [
	    "name",
	    "email",
	    "tons",
	    "quantity"
	   ]
	  }
};

/* GET home page. */
router.get('/', (req, res) => {

  jsf.resolve(schema).then(sample => {
  	   console.log(util.inspect(sample, 
  	   	{showHidden: false, depth: null}));
	   
	   res.render('feedback', 
	  	{  climate:  sample });
  });

  
});

module.exports = router;
