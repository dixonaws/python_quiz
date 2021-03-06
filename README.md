Build An Alexa Quiz Skill in Python using ASK Python SDK
=============

![Tutorial Header](https://m.media-amazon.com/images/G/01/mobile-apps/dex/alexa/alexa-skills-kit/tutorials/fact/header._TTH_.png)

## What You Will Learn
*  [AWS Lambda](http://aws.amazon.com/lambda)
*  [Alexa Skills Kit (ASK)](https://developer.amazon.com/alexa-skills-kit)
*  Using the [Skill builder (beta)](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/ask-define-the-vui-with-gui)
*  Voice User Interface (VUI) Design

## What You Will Need
*  [Amazon Developer Portal Account](http://developer.amazon.com)
*  [Amazon Web Services Account](http://aws.amazon.com/)
*  The sample code on [GitHub](https://github.com/dixonaws/autoguide).
*  [ASK Python SDK](https://github.com/alexa/alexa-skills-kit-sdk-for-python)
*  A basic understanding of Python.

## Instructions
1. Use the ASK CLI to create a new Alexa skill based on this repository<br>
```
ask new --template --skill-name "autoguide" --url https://raw.githubusercontent.com/dixonaws/reinvent_cvra_bootcamp_alexaskill/master/alexaskills.json
```

This will create a new directory called "autoguide"
 
2. Install the dependencies in the lambda/py directory<br>
Change to the "autoguide" directory and issue the following command:
```bash
pip install -r lambda/py/requirements.txt -t lambda/py

```
This command will install all of the dependencies that the Lambda function will need to execute 
when invoked by the Alexa skill (e.g., the ask SDK, Python requests library, etc.)

3. Deploy the skill<br>
Issue the following command:
```bash
ask deploy
```

This will deploy the Alexa skill so that it will be visible in the developer.amazon.com 
console. Deployment will link your Alexa skill with a supporting Lambda function that will 
be deployed in your AWS account. Check to make sure that both have been created successfully. The
Alexa skill should be visible at https://developer.amazon.com/alexa/console/ask# and the Lambda
function should be visible in your AWS console.

4. Update the Lambda function<br>
We need to update the Lambda with your VehicleTripTable and an IAM role. We can accomplish
this on one command with the AWS CLI. Edit the lambda-update-function-configuration.json file 
and add your VehicleTripTable accordingly.

Then issue the following command:
```bash
aws lambda update-function-configuration --cli-input-json fileb://lambda-configuration.json --function-name <your_lambda_function>
```

> If you used as "AutoGuide" as the skill name, then your Lambda function would be named "ask-custom-autoguide-default"

> Your Lambda function name is listed in .ask/config   

If the update suucceeded, you should see something like this:
```json
{
    "FunctionName": "autoguide",
    "FunctionArn": "arn:aws:lambda:us-east-1:1234567890:function:ask-py-autoguide",
    "Runtime": "python3.6",
    "Role": "arn:aws:iam::1234567890:role/ask-lambda-python-autoguide",
    "Handler": "lambda_function.lambda_handler",
    "CodeSize": 2419973,
    "Description": "Lambda function supporting the reinvent-cvra-bootcamp Alexa skill",
    "Timeout": 8,
    "MemorySize": 128,
    "LastModified": "2018-09-25T20:01:41.924+0000",
    "CodeSha256": "u0f1Uy6Cp7b8xD0tHEXMabc123psbKR5U=",
    "Version": "$LATEST",
    "VpcConfig": {
        "SubnetIds": [],
        "SecurityGroupIds": [],
        "VpcId": ""
    },
    "Environment": {
        "Variables": {
            "TripTable": "myTripTable"
        }
    },
    "TracingConfig": {
        "Mode": "PassThrough"
    },
    "RevisionId": "c5c88456-f78d-4477-95ed-9666761891cd"
}

```

5. Test the Alexa skill<br>
Go to developer.amazon.com > Alexa Skills Kit and click on your new skill. From the Test tab,
launch the skill with "open <skill name>". Or, you can use the ASK CLI to do this with:
```bash
ask simulate --text "open autoguide" --locale "en-US"
```

## What Your Skill Will Do
The Skill allows users to ask Alexa about their connected vehicle, either while on a trip 
or from the desk (even while the vehicle is off). You can ask such things as:
- "Alexa, ask Autoguide about my recent trips"
- "Alexa, ask Autoguide about my current trip"
- "Alexa, ask Autogiode if my vehicle needs maintenance"

