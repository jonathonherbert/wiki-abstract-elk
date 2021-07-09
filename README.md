## wiki-abstract-elk

Contains a Docker image designed to ingest a list of wikipedia titles from a dump of the article abstract.

## Prerequisites

[Docker](https://www.docker.com/), a reasonably quick internet connection, and a fair amount of disk space for Elasticsearch to index and store the data.

## Running

1. Download a copy of enwiki-latest-abstract.xml.gz and extract its contents to the repository root. The dumps are available [here](https://dumps.wikimedia.org/enwiki/latest/).
2. Run `docker compose up` in the repository root, and wait for the image to come up.
3. Hit `http://localhost:5601/app/kibana`. You should see the Kibana dashboard.

## Querying

The title of the wikipedia page is a handy thing to search on. Try a POST request with the header `Content-Type: application/json` and the following body:

```json
{
    "query": {
        "multi_match": {
            "query": "Tycho Brahe",
            "fields": ["title"],
            "fuzziness": "AUTO",
            "prefix_length": 2
        }
    }
}
```

Using `curl` this would be:

```bash
curl --location --request GET 'http://localhost:9200/wiki/_search' \
--header 'Content-Type: application/json' \
--data-raw '{
    "query": {
        "multi_match": {
            "query": "Tycho Brahe",
            "fields": ["title"],
            "fuzziness": "AUTO",
            "prefix_length": 2
        }
    }
}'
```
