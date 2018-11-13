# Billow POC: Bike Sharing Application
**bil·low** ['bilō]: a large undulating<sup>1</sup> mass of something, typically *cloud*, smoke or steam.

<sup>1</sup>**undulating** [ˈʌnjəlādiNG]: having a *smoothly* rising and falling form or outline.

Pretend this is an umbrella repository and each directory is a separate repository.

The application can be run as follows:

```
billow env bikesharing-dev
billow up
```

where `billow up` is short for:

```
billow restore
billow build
billow deploy
```

And can be taken down just as easily:

```
billow down
```

A billow can be published to a billow registry:

```
billow publish
```

Which allows it to be referenced and reused by other billows.

A locked stamp of a billow can be produced:

```
billow stamp sprint43
```

Which outputs a billow.sprint43.yaml file that contains a full closure of dependencies locked to the versions that resolve at the time of stamping.

Billow stamps can be published:

```
billow publish sprint43
```

And repeatably deployed directly from the registry:

```
billow env bikesharing-staging
billow deploy bikesharing:sprint43
billow env bikesharing-prod
billow deploy bikesharing:sprint43
```

Partial aspects of the application can be rendered:

```
cd reservations
billow env reservations-feature
billow up
```

This spins up everything needed to run the reservations service.

If, instead of spinning up unique copies of everything, is is desired to reuse existing dependencies from another environment, a derived environment can be created:

```
billow env reservations-feature --base bikesharing-dev
```

Then only the reservations service is spun up and all its dependencies are inherited from the base environment. Still, it remains possible to test the application end-to-end with only the changes to the reservations service being applied:

```
$ billow describe bikesharing/frontend
endpoint: https://reservations-feature.s.frontend5it7dj.z22.eastus.azure.com
```
