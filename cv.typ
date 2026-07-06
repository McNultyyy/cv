// Will McNulty — CV
// Build:        typst compile cv.typ cv.pdf
// Live preview: typst watch cv.typ cv.pdf
//
// TODO(dates): the two Senior SWE roles at NewDay overlap (Feb 2020 -- Oct 2022
// vs Jun 2022 -- Present). Confirm the real perm-end / contract-start dates and
// whether to present it as a perm-to-contract conversion.
// TODO(header): add location / right-to-work line once confirmed (e.g. "London, UK").
// TODO(metrics): optional polish, one number is enough. Best candidate: test-suite
// time before vs after the in-memory component-testing migration (e.g. "40 min -> 2 min")
// and how many services — goes in the "Led an initiative to migrate all services..."
// bullet under SCA. Second choice: rough closed-loop scale (partners/tenants or
// transactions/day). Full question list lives in Claude's memory (cv-open-items).

#set document(title: "Will McNulty — CV", author: "Will McNulty")
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.2cm))
#set text(size: 10pt)
#set list(indent: 0.8em, spacing: 0.5em)
#set par(justify: true)

#let accent = rgb("#2b6cb0")

#show link: set text(fill: accent)

#show heading.where(level: 1): it => block(above: 1em, below: 0.55em)[
  #text(fill: accent, size: 13pt, weight: "bold")[#it.body]
  #v(-0.7em)
  #line(length: 100%, stroke: 0.8pt + accent)
]

#show heading.where(level: 2): it => block(above: 0.9em, below: 0.4em)[
  #text(size: 12pt, weight: "bold")[#it.body]
]

// A job title with right-aligned dates.
#let role(title, dates) = block(above: 0.8em, below: 0.4em)[
  #grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#title],
    text(style: "italic")[#dates],
  )
]

// A bold mini-heading for a workstream within a role.
#let workstream(name) = block(above: 0.65em, below: 0.3em)[
  #text(weight: "bold")[#name]
]

// A project entry: name plus italic tagline.
#let project(name, tagline) = block(above: 0.8em, below: 0.3em)[
  #text(weight: "bold")[#name] — #text(style: "italic")[#tagline]
]

// ---------------------------------------------------------------- Header

#align(center)[
  #text(size: 20pt, weight: "bold")[Will McNulty]

  #text(size: 11pt)[Senior Software Engineer (Contract) — C\#/.NET · Azure · Fintech & Payments]

  #link("mailto:william.mcnulty@live.co.uk")[william.mcnulty\@live.co.uk] ·
  #link("https://github.com/McNultyyy")[github.com/McNultyyy] ·
  #link("https://linkedin.com/in/william-mcnulty-33b91199")[linkedin.com/in/william-mcnulty-33b91199]
]

#v(0.4em)

Senior software engineer with 10+ years' experience — the last 8 at NewDay
building payment and identity systems on Azure across Strong Customer
Authentication (2FA), Open Banking (PSD2), Apple & Google Pay wallets, and AML.
Led teams of 3 delivering wallet APIs and a new AML journey, and drove quality
initiatives such as the move to in-memory component testing across all services.
Owns the full lifecycle: architecture, build, testing standards, and production
observability.

= Key Skills

#grid(
  columns: (8.5em, 1fr),
  row-gutter: 0.55em,
  text(weight: "bold")[Languages], [C\#, F\#, TypeScript, PowerShell, Solidity, PineScript],
  text(weight: "bold")[Frameworks], [.NET Core, ASP.NET, Entity Framework, Angular, IdentityServer4],
  text(weight: "bold")[Azure], [Functions, Event Grid, Queue Storage, API Management, Key Vault, Managed Identity, Web Apps],
  text(weight: "bold")[Data], [SQL Server (incl. Always Encrypted), CosmosDB],
  text(weight: "bold")[DevOps & Tooling], [Terraform, Pulumi, GitHub Actions, TeamCity, Octopus Deploy, Docker, Grafana, Git, Unix],
  text(weight: "bold")[Domain], [SCA/2FA, Open Banking (PSD2), AML, Apple & Google Pay wallets, event sourcing, multi-tenant systems, BDD & contract testing],
)

= Professional Experience

== NewDay

#role[Senior Software Engineer (Contract)][Jun 2022 -- Present]

#workstream[Closed-Loop Transaction Processing]
- Building NewDay's closed-loop transaction journey for partners.
- Co-developing the custom event-sourcing library used by the application.
- Building the multi-tenanted system — shared compute with isolated storage.
- Creating Grafana dashboards and alerting for the transaction-processing system.

#workstream[Identity]
- Worked to bring the Identity platform up to NewDay's testing standards, adding component-level tests for all customer journeys with both in-memory and over-the-wire Docker mocks.
- Built a test-library plugin that auto-generates PlantUML sequence diagrams from every HTTP test.
- Split a shared database in two with Redgate SQL Compare and other tooling, to reduce coupling between the two services.
- Enabled SQL Server Always Encrypted on the database, with support for local Docker integration.
- Replaced ad-hoc SQL change scripts with a custom, environment-aware implementation of Entity Framework migrations, plus data-seeding scripts.

#role[Senior Software Engineer][Feb 2020 -- Oct 2022]

#workstream[Secure Customer Authentication (SCA)]
- Worked on a highly configurable Strong Customer Authentication (SCA) Web API service providing 2FA for customers.
- Integrated encrypted requests from a third-party client — managed the Public Key Infrastructure, with certificates stored in Azure Key Vault and secured via Azure Managed Identity.
- Implemented a message outbox pattern with Azure Event Grid, Azure Functions, and Azure Queue Storage for asynchronous data exchange between SCA and dependent microservices.
- Built Grafana dashboards from built-in Azure and custom metrics for service uptime and third-party dependency alerting and monitoring, driving improvements in application stability and performance.
- Led an initiative to migrate all services from tests against cloud-deployed instances to in-memory component testing, for quicker and more reliable test suites.
- Championed and upgraded several services to a higher standard of testing with behaviour-driven and contract testing.

#workstream[Open Banking]
- Implemented PSD2 requirements on NewDay's Open Banking solution and integrated it with the in-house identity platform (IdentityServer4) — enabling customers to securely connect their accounts to third-party financial apps and services; API access exposed and managed via Azure APIM.
- Semi-automated the certificate renewal process with the Open Banking directory.

#workstream[Mobile Wallets & AML (BIP)]
- Led a team of 3 building the backend APIs for Apple Pay and Google Pay wallet integration — REST APIs on Azure Functions, exposed to the mobile BFF via Azure API Management — letting customers add their NewDay cards and pay by smartphone.
- Led a team of 3 delivering "Penny Drop", a new AML journey designed to be less intrusive and more user-friendly than traditional checks, integrating with the third party's SOAP service via WSDL.
- Designed and iterated the system architecture in PlantUML.
- Ensured all services had integration and performance test coverage.

#role[Software Engineer][Apr 2018 -- Jan 2020]

#workstream[Domain Services]
- Partnered with product teams to identify common domains and built them out as domain-specific REST microservice APIs.
- Built an automated C\# connector generator for each domain API, publishing a versioned client library to the internal NuGet feed with every API release for teams to integrate easily.
- Built standardised TeamCity and Octopus project templates for teams to clone, enabling quick cloud deployment with minimal setup.
- Published reusable PowerShell deployment scripts in Octopus handling cross-cutting concerns (logging, AD resource access management).

#workstream[Acquisitions]
- Built and deployed multiple Angular frontends as Azure Web Apps, connected to their WebAPI backends via the Backend-for-Frontend pattern.
- Updated the frontend and built new backend microservices handling the new AML checks in the OwnBrands acquisition web journey.

== ICBC Standard Bank

#role[Software Engineer][Aug 2015 -- Sep 2017]

- Developed an in-house incident-reporting application with the front-office team, working closely with stakeholders on requirements and following security and reliability best practices.
- Created an interactive management dashboard giving a high-level view of incident state, helping managers quickly identify issues and track progress to resolution — improving efficiency and reducing downtime.
- Built an internal toolkit automating otherwise-manual tasks (trade validation, trade-file loading), used by the team for testing and development — improving efficiency and reducing the risk of human error.
- Set up and managed scheduled and ad-hoc file transfers with GoAnywhere MFT, configuring and testing workflows for reliability and security.
- Built and supported real-time and batch interfaces feeding trade data to the appropriate target systems.
- Managed and updated the message-queue setup as part of a large application upgrade.

= Projects

#project[Futures Trading Bot][An automated trading bot for futures instruments]
- Implemented an algorithm based on the Opening Range concept in NinjaScript, configurable across time windows, timeframes, and risk parameters.

#project[Crypto Command Centre][An extensible CLI for managing common tasks across chains and exchanges]
- Implemented commands to programmatically move assets between venues, find the highest-yield venue for an asset (single-sided LP/staking), and move or withdraw it from the yield provider.
- Exposed the CLI via a Telegram bot; created a script to auto-generate C\# bindings from Solidity contracts.

#project[Crypto Arb Bot][An arbitrage trading bot for cryptocurrencies]
- Developed a bot analysing arbitrage yields across cryptocurrency exchanges — perpetual-futures funding rates vs spot borrowing rates — using exchange APIs for data and real-time trading decisions.
- Implemented multiple order-execution strategies (limit and market orders) to maximise profit while minimising risk.
- Ran live for 3 months on personal capital, generating consistent profits from arbitrage trades.

#project[NewDay Hackathons][2020 & 2022]
- 2022 — Carbon Footprint Tracker (team of 4, built over a weekend): priced the carbon cost of every customer transaction via NewDay's Transactions API and external data providers; built the backend APIs, integrating a third party to plant a tree when customers made enough "green-alternative" purchases. Highly commended by judges, with positive feedback from NewDay's senior management.
- 2020 — Real-time AML passport checks (team of 3): proof-of-concept mobile app using customer selfies and machine learning to analyse passport data for real-time anti-money-laundering checks. Won third place, with judges praising its innovative approach to AML compliance.

= Education

#role[Royal Holloway, University of London — BSc Computer Science, First Class Honours][2012 -- 2015]
- Final-year project (value at risk and financial modelling): built a VaR model in Java estimating the maximum possible loss of an investment portfolio at a given confidence level, using Monte Carlo simulation and historical data analysis to produce accurate risk estimates; presented to academic staff and industry professionals at a student conference.

#role[Kingsdale Sixth Form — Maths, IT, Physics A-Levels][2010 -- 2012]
