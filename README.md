Symfony Demo Application
========================

The "Symfony Demo Application" is a reference application created to show how
to develop applications following the [Symfony Best Practices](https://symfony.com/doc/current/best_practices/index.html). Original [Read me](https://github.com/symfony/demo)

## Run Locally with docker and docker-compose

Run the following command:

```bash
docker-compose up
```

Then hit `http://localhost:8080` on your browser.

## Run on Google Cloud Run

[![Run on Google Cloud](https://storage.googleapis.com/cloudrun/button.svg)](https://console.cloud.google.com/cloudshell/editor?shellonly=true&cloudshell_image=gcr.io/cloudrun/button&cloudshell_git_repo=https://github.com/geshan/symfony-demo-google-cloud-run.git)

## Gotcha

As it uses a `sqlite` which is a local file, all changes will be lost as the file is not saved to a bucket.

