# Week 2 — Distributed Tracing

## Class notes 

![class notes 1 of 2](./assets/week2/live-lesson-1-2.png)
![class notes 2 of 2](./assets/week2/live-lesson-notes-2-2.png)

## Instrument Honeycomb with OTEL

OTEL ([OpenTelemetry](https://opentelemetry.io/)) is a collection of tools, APIs, and SDKs. Use it to instrument, generate, collect, and export telemetry data (metrics, logs, and traces) to help you analyze your software’s performance and behavior.

[Honeycomb](https://www.honeycomb.io/) attach our flask application backend to Honeycomb UI and then you can analyze the app with honeycomb services.

Some concepts:
- Span: represent a single unit of work done to serve the request. Has a start time, duration. For example, a db query.
- Trace: composed of a spans (of time)
- Instrumentation: code that sends the data that makes a trace

Follow the instructions [Honeycomb Python OTEL](https://docs.honeycomb.io/getting-data-in/opentelemetry/python/#install-packages).

```console
pip install opentelemetry-api
pip install opentelemetry-sdk
pip install opentelemetry-exporter-otlp-proto-http
pip install opentelemetry-instrumentation-flask
pip install opentelemetry-instrumentation-requests
```

Create an environment `bootcamp` which has a specific `HONEYCOMB_API_KEY`.

The service name `HONEYCOMB_SERVICE_NAME` is a made-up name to identify a each unique service. This will determine the service's name in the spans that get sent from our app.

![env config](./assets/week2/honeycomb_setup_envs.png)

We're configuring OTEL to send data to Honeycomb. Our app is sending standardized messages to Honeycomb which stores it inside it's database and gives a UI to look at them. How? by example, using OTEL's library `opentelemetry-instrumentation-requests` which uses Python's HTTP client to instrument every out-going request.

You can configure OTEL to send data to other `OTEL backends`.

To debug add another `span processor` a, `simple`, with a `console span exporter` so instead of sending it to OTEL over the internet, sends it to the stdout.

![](./assets/week2/honeycomb_debug_simple_processor.png)

Also, a  useful tool is Jessica's [What Honeycomb.io team is this?](https://honeycomb-whoami.glitch.me/), we pass a `honeycomb api key` and it returns some info about the environment:

![whoami](./assets/week2/honeycomb-whoami-glitch-tool.png)

A `dataset` was automatically created when data arrived for that environment. A series of charts are shown:

![data received](./assets/week2/honeycomb_span_charts.png)

And also shown as a list of recent events:

![recent events](./assets/week2/honeycomb_recent_span_events.png)

View trace button, we see the trace where a call happened to a specific url, has a single span, a `root-span` (the top-level one) and nothing happened inside them. We can also see additional info like `attributes` and `fields` that automatically generated thanks to the OTEL instrumentation.

To show a more detail trace, we can hardcode a span, with `mock-data` span with added `fields` In this case, the spans become replaces for logs, because we can get everything we need in the 'story' context. Our app custom attributes usually are prefixed with `app`, and as value any serializable value is okay (number, string, boolean)

![](./assets/week2/honeycomb-home-activities-mock-data.png)

`queries` are a way of visualizing data, create custom queries that over all our spans (similar SQL language, but Honeycomb uses a custom db language implementation)  

![query based on our custom field](./assets/week2/honeycomb_first_query.png)

Show the metric `latency`: how long the request take? duration in milliseconds. `Heatmap` and `P90 percentile` are useful to respond for this, what is the number such that 90% of request are faster than this?

![latency query metric](./assets/week2/honeycomb_queries_latency.png)

## Extra Info

### Git tags
List existing tags:

`git tag`

Create a new tag (lightweight):

`git tag week2`

To tag commits after you’ve moved past them:

`git tag week2 9fceb02`

By default, the git push command doesn’t transfer tags to remote servers. You will have to explicitly push tags:

`git push --tags`

To delete a local tag in the repo:

`git tag -d week2`

To delete a remote tag:

`git push origin --delete week2`

[More on git tags](https://git-scm.com/book/en/v2/Git-Basics-Tagging)

### Extra: Percentile latency metric
When I say 99 percentile is 10ms means 99% of my requests are less than 10ms. For this calculation we need to sort all the requests, it's not simple. Is an approximation.

[Percentile Tail Latency Explained (95%, 99%) Monitor Backend performance with this metric by Hussein Nasser](https://www.youtube.com/watch?v=3JdQOExKtUY)