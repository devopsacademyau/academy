- [Serverless Integration patterns](#serverless-integration-patterns)
	- [Simple API and Robust APIs](#simple-api-and-robust-apis)
	- [Strangler pattern](#strangler-pattern)
	- [Publish/Subscriber messaging](#publishsubscriber-messaging)
	- [Tolerant Asynchronous Messaging](#tolerant-asynchronous-messaging)
	- [Queue-based Load Leveling](#queue-based-load-leveling)
	- [Flat files](#flat-files)
		- [References](#references)
- [AWS services](#aws-services)
	- [DynamoDB Streams](#dynamodb-streams)
	- [Simple Notification Service (SNS)](#simple-notification-service-sns)

# Serverless Integration patterns

While using serverless computing and managed services, you can really leverage the pay-as-you-go model and flexibility to build complex solutions.

You don’t have to worry much about managing infrastructure, provisioning or planning for demand and scale (keep an eye on service limits).

Here are some architectural patterns that you can apply in your solution.

## Simple API and Robust APIs 

> https://www.enterpriseintegrationpatterns.com/patterns/messaging/EncapsulatedSynchronousIntegration.html

Routing to multiple systems using API gateway resources. 

![](assets/api_gw.png)

It’s highly recommended that functions are stateless, sessions are cached and connections to downstream services are handled appropriately.

## Strangler pattern

The Strangler pattern is a technique to gradually migrate legacy systems. In this pattern a service acts as a facade that intercepts requests from the clients, and routes them to either the legacy service or new services.

![](assets/strangler.png)

An Application Load Balancer (or API gateway - proxy) routes clients’ requests to the Orders Service, the first microservice the team implemented. Everything else continues to go to the Legacy application.

The Legacy components gradually becomes smaller and smaller until you completely migrate it to microservices.

Reference:
- [DynamoDB Streams](#dynamodb-streams)


## Publish/Subscriber messaging

> https://www.enterpriseintegrationpatterns.com/patterns/messaging/PublishSubscribeChannel.html

In Publisher-Subscriber services publish events through a channel as messages. Multiple interested consumers listen to the events by subscribing to these channels.

It allows building loosely-coupled architectures that overcome the limits of remote service communication, like latency and unreliability. - [Eduardo Romero](https://medium.com/@eduardoromero/serverless-architectural-patterns-261d8743020#ba1c)

![](assets/sns.png)

In this example the `Service 1` publishes a message to the SNS Topic. The service is not aware of what is subscribed to the Topic. The subscriptions to the SNS topic are created usually when a service is deployed or another process (for email/SMS subscriptions for example). The message is then published at least once for every subscriber.

> Besides the known limitation and guarantees of each messaging service there should be conscious considerations for message duplication, message ordering, poisonous messages, sharding, and data retention.
> Publisher / Subscriber is a great match for event-driven architectures.

Technical References:
- [Simple Notification Service (SNS)](#simple-notification-service-sns)

## Tolerant Asynchronous Messaging



## Queue-based Load Leveling

> https://read.acloud.guru/applying-the-decoupled-invocation-pattern-with-aws-lambda-2f5f7e78d18


## Flat files
> https://www.enterpriseintegrationpatterns.com/patterns/messaging/FileTransferIntegration.html

![](https://www.enterpriseintegrationpatterns.com/img/FileTransferIntegration.gif)

### References

- https://medium.com/@eduardoromero/serverless-architectural-patterns-261d8743020#d84d

# AWS services

## DynamoDB Streams

DynamoDB Streams is a feature in DynamoDB service that allows you to stream in a time series temporary storage (max TTL 24 hours) the changes that happened to a Table.

![](assets/ddb_stream.png)

Key points:
- A DynamoDB stream is an *ordered flow*. Each stream record is a change in the Table and appears just once in the stream.
- Encryption at rest encrypts the data in DynamoDB streams. 
- Each stream record appears exactly once in the stream.
- For each item that is modified in a DynamoDB table, the stream records appear in the same sequence as the actual modifications to the item.

DynamoDB Streams supports the following stream record views:

- **KEYS_ONLY**: Only the key attributes of the modified item
- **NEW_IMAGE**: The entire item, as it appears after it was modified
- **OLD_IMAGE**: The entire item, as it appears before it was modified
- **NEW_AND_OLD_IMAGES**: Both the new and the old images of the item

Some use cases include (some the AWS website):
- An application in one AWS Region modifies the data in a DynamoDB table. A second application in another Region reads these data modifications and writes the data to another table, creating a replica that stays in sync with the original table.

- A popular mobile app modifies data in a DynamoDB table, at the rate of thousands of updates per second. Another application captures and stores data about these updates, providing near-real-time usage metrics for the mobile app.

- A global multi-player game has a multi-master topology, storing data in multiple AWS Regions. Each master stays in sync by consuming and replaying the changes that occur in the remote Regions.

- An application automatically sends notifications to the mobile devices of all friends in a group as soon as one friend uploads a new picture.

- A new customer adds data to a DynamoDB table. This event invokes another application that sends a welcome email to the new customer.

## Simple Notification Service (SNS)

