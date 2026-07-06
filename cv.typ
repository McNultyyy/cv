// Will McNulty — CV
// Build:        typst compile cv.typ cv.pdf
// Live preview: typst watch cv.typ cv.pdf

#set document(title: "Will McNulty — CV", author: "Will McNulty")
#set page(paper: "a4", margin: (x: 1.6cm, y: 1.5cm))
#set text(size: 10pt)
#set list(indent: 0.8em, spacing: 0.65em)
#set par(justify: true)

#let accent = rgb("#2b6cb0")

#show link: set text(fill: accent)

#show heading.where(level: 1): it => block(above: 1.4em, below: 0.8em)[
  #text(fill: accent, size: 14pt, weight: "bold")[#it.body]
  #v(-0.7em)
  #line(length: 100%, stroke: 0.8pt + accent)
]

#show heading.where(level: 2): it => block(above: 1.1em, below: 0.5em)[
  #text(size: 12pt, weight: "bold")[#it.body]
]

// A job title with right-aligned dates.
#let role(title, dates) = block(above: 1em, below: 0.5em)[
  #grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#title],
    text(style: "italic")[#dates],
  )
]

// A bold mini-heading for a workstream within a role.
#let workstream(name) = block(above: 0.8em, below: 0.4em)[
  #text(weight: "bold")[#name]
]

// A project entry: name plus italic tagline.
#let project(name, tagline) = block(above: 1em, below: 0.4em)[
  #text(weight: "bold")[#name] \
  #text(style: "italic")[#tagline]
]

// ---------------------------------------------------------------- Header

#align(center)[
  #text(size: 22pt, weight: "bold")[Will McNulty]

  #text(size: 11pt, style: "italic")[Senior Software Engineer]

  #link("https://github.com/McNultyyy")[GitHub] ·
  #link("mailto:william.mcnulty@live.co.uk")[Email] ·
  #link("https://linkedin.com/in/william-mcnulty-33b91199")[LinkedIn]
]

= Professional Experience

== NewDay

#role[Senior Software Engineer (Contract)][Jun 2022 -- Current]

#workstream[Closed Loop]
- Currently working to build out our Closed-Loop transaction journey for partners.
- Helping to build out our own custom event-sourcing library used for our application.
- Building out our multi-tenanted system (with shared compute and isolated storage)
- Creating Grafana dashboards and adequate alerting for our transaction processing system.

#workstream[Identity]
- Worked to bring our Identity platform up to the NewDay testing standards.
- Added component-level tests for all customer journeys, with both in-memory and over-the-wire Docker mocks.
- Created a plugin for our test library to automatically generate PlantUML sequence diagrams for all HTTP tests.
- Used RedGate SQL Compare and other tools to separate a previous shared database into two in order to reduce coupling between our two services.
- Updated our SQL Server Database to use the SQL Server Always Encrypted feature, with support for local Docker integration.
- Converted our existing database-change process from running ad-hoc SQL scripts to using a custom implementation of Entity Framework migrations which was environment aware, as well as including a number of data-seeding scripts.

#role[Senior Software Engineer][Feb 2020 -- Oct 2022]

#workstream[Secure Customer Authentication]
- Worked on a highly configurable Strong Customer Authentication (SCA) Web API service, enabling 2FA support for customers.
- Integrated with encrypted requests from our third party client, which required Public Key Infrastructure management, stored relevant certificates within Azure KeyVault and secured via Azure Managed Identity.
- Implemented a message outbox pattern using a combination of Azure EventGrid, Azure Functions, and Azure Queue Storage to handle asynchronous data exchange between SCA and required microservices.
- Utilized both built-in Azure, and custom, metrics to build a Grafana dashboard for service uptime and third party dependency alerts and monitoring. These dashboards provided valuable insights which led to improvements in application stability and performance.
- Led an initiative to update all our services to use in-memory component testing for quicker and more reliable test-suites, which were previously run against a cloud deployed instance.
- Pushed for, and updated a number of, our services to a higher standard of testing using behaviour driven and contract testing.

#workstream[Open Banking]
- Worked on the Open Banking solution to implement PSD2 requirements and integrated it with NewDay's in-house Identity Management solution (IdentityServer4). The solution enabled customers to securely connect their NewDay accounts with third party financial apps and services.
- Exposed and managed API access via Azure APIM.
- Implemented solution for semi-automated certificate renewal process with Open Banking directory.

#workstream[BIP]
- Led a team of 3 developers to implement backend API services required for Google and Apple mobile Wallet integration, enabling customers to add their NewDay cards to their mobile wallets and make payments using their smartphones.
- Developed the REST APIs using Azure Functions and integrated them with our mobile BFF using Azure API Management.
- Led a team of 3 developers to implement a new AML journey called "Penny Drop" which was designed to be less intrusive and more user friendly than the traditional AML checks.
- Designed and iterated on the system architecture visually using PlantUML.
- Integrated with the third party's SOAP service using WSDL.
- Ensured all services had adequate integration and performance testing.

#role[Software Engineer][April 2018 -- Jan 2020]

#workstream[Domain Services]
- Worked with existing product teams to determine common domains and then built these out as domain specific REST microservice APIs.
- Developed and automated a custom C\# connector generator for each domain API and published to our internal NuGet feed for teams to easily integrate. As new versions of the API were published, a new version of the connector library was also published.
- Built standardised templated projects in TeamCity and Octopus for teams to clone which allowed them to quickly deploy into a Cloud environment with minimal setup.
- Built a number of reusable PowerShell scripts, published in Octopus, to handle cross cutting concerns when deploying into an environment e.g. logging, AD resource access management.

#workstream[Acquisitions]
- Built out and deployed multiple Angular frontend web UIs as Azure WebApps.
- Connected frontend to its WebAPI backend using the Backend for Frontend pattern.
- Updated the frontend and built out new backend microservices to handle the new AML checks within our OwnBrands Acquisition web journey.

== ICBC Standard Bank

#role[Software Engineer][Aug 2015 -- Sept 2017]

- Developed an in-house incident reporting application in collaboration with the front office team. This involved working closely with stakeholders to understand their requirements, and building an application that met their needs while also adhering to best practices for security and reliability.
- Created an interactive dashboard for managers that provided a high-level view of the state of the incident reporting application. This dashboard allowed managers to quickly identify issues and track progress towards resolving them, improving overall efficiency and reducing downtime.
- Developed an internal toolkit to automate common, and otherwise manual, tasks such as trade validation and trade file loading, which was used by team mates for testing and development. This toolkit improved overall efficiency and reduced the risk of human errors.
- Setting up and managing scheduled and ad hoc file transfers using GoAnywhere's MFT solution. This involved configuring and testing the file transfer workflows to ensure they were reliable and secure.
- Creating and supporting real-time and batch interfaces to feed trade data to the appropriate target systems.
- Managing and updating the message queue setup as part of a large application upgrade

= Projects

#project[Futures Trading Bot][An automated trading bot for futures instruments]
- Implemented an algorithm, based on the Opening Range concept, to trade futures instruments using NinjaScript
- Allowed for configuration such that the algorithm can work in different time windows, time frames and within different risk parameters.

#project[Crypto Command Centre][An extensible command line tool to easily manage common tasks across chains and exchanges]
- Implemented commands to programmatically move assets from one venue to another.
- Added the ability to quickly find the venue with the highest yield for a given asset (single sided LP/staking), as well as the ability to move or remove the asset from the yield provider.
- Exposed the CLI tool via a Telegram bot.
- Created script to auto-generate C\# bindings from solidity contracts.

#project[Crypto Arb Bot][An arbitrage trading bot for crypto currencies]
- Developed a trading bot that analyzes the possible arbitrage yields across multiple crypto currency exchanges, taking into account funding rates for perpetual futures contracts and interest rates for borrowing spot assets.
- Implemented multiple order execution strategies, including limit and market orders, to maximize profit potential while minimizing risk.
- Utilized APIs from various exchanges to gather data and make real-time trading decisions.
- Demonstrated the ability to generate consistent profits through successful arbitrage trades.

#project[NewDay Hackathon 2022][Carbon Footprint Tracker]
- Worked over a weekend with a team of 4 developers to create a carbon footprint tracker that integrated with NewDay's Transactions API and external data providers to calculate the carbon cost of each transaction made by a customer.
- Developed the backend API services and integrated with a third-party provider to plant a tree when a customer made a number of "green alternative" transactions.
- The app was highly commended by judges and received positive feedback from NewDay's senior management.

#project[NewDay Hackathon 2020][Realtime Customer AML Checks using Passport Data]
- Worked with a team of 3 developers to create a proof-of-concept mobile app that used customer selfies along with machine learning algorithms to analyze passport data and perform real-time anti-money laundering (AML) checks.
- The app won third place in the hackathon, with judges praising its innovative approach to AML compliance.

#project[University Final Year Project][Value at Risk and Financial Modeling]
- Created a value-at-risk (VaR) model in Java to estimate the maximum possible loss of an investment portfolio at a given confidence level.
- Used statistical techniques such as Monte Carlo simulations and historical data analysis to produce accurate risk estimates.
- Presented findings to academic staff and industry professionals at a student conference.

= Education

#role[Royal Holloway, University of London][2012 -- 2015]
#text(style: "italic")[Computer Science BSc, First Class Honours]

#role[Kingsdale Sixth Form][2010 -- 2012]
#text(style: "italic")[Maths, IT, Physics A-Levels]

= Technical Experience

#grid(
  columns: (11em, 1fr),
  row-gutter: 0.7em,
  text(weight: "bold")[Languages], [C\#, F\#, TypeScript, Solidity, PineScript, Terraform, PowerShell],
  text(weight: "bold")[Databases], [SQL Server, CosmosDB],
  text(weight: "bold")[Libraries/Frameworks], [.NET Core, ASP.NET],
  text(weight: "bold")[Cloud/Services], [Azure, Octopus Deploy, TeamCity, GitHub Actions, Pulumi],
  text(weight: "bold")[Other], [Git, Unix],
)

= References

Available on request
