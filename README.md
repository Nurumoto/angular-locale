# Angular Dynamic Locale


### Requirements

* **AngularJS v1.0.7+** is currently required.

### Changing the locale

This module defines two services, these are `tmhDynamicLocale` and
`tmhDynamicLocaleCache`.

The service `tmhDynamicLocale` provides has one method `set(newLocale)` to
change the locale.

```javascript
tmhDynamicLocale.set('it');
```

Keep in mind that the locale will be changed asynchronously 


After the locale is changed, the event `'$localeChangeSuccess'` will be
triggered.

Calling `tmhDynamicLocale.set` will return a promise that will be resolved
when the locale is loaded and will resolve to the new locale.

The service `tmhDynamicLocaleCache` is a `$cache` of all the loaded locales,
where the key is the locale id and the value is the locale object.


This module expects for the angular locales to be present at
`angular/i18n/angular-locale_{{locale}}.js`.
If the locales are at another URL, this can be changed at
`tmhDynamicLocaleProvider` using `localeLocationPattern(string)`.


It is possible to specify a storage location for the locale using
`tmhDynamicLocaleProvider.useStorage(storageName)`, the name of the
storage must follow the same signature as `$cookieStore`. The default
storage location is to use a `$cache`, this default storage is not persistent.

It is possible to ask the storage to be `$cookieStore` using the shortcut
`tmhDynamicLocaleProvider.useCookieStorage()`, internally this is
exactly as performing `tmhDynamicLocaleProvider.useStorage('$cookieStore')`

## Installation

Using npm:

`npm install angular-dynamic-locale`

Using bower:

`bower install angular-dynamic-locale`

## Usage

Add the js file to your html:

```html
<script src="myPath/tmhDynamicLocale.js"></script>
```

Add the module to your dependencies:

```javascript
angular.module('myApp', ['tmh.dynamicLocale', ...])
```

Inject `tmhDynamicLocale` to your controller and set the desired locale:

```javascript
angular.module('myApp').controller('myController', [..., 'tmhDynamicLocale',
  function(..., tmhDynamicLocale) {
    tmhDynamicLocale.set('en');
  }
])
```

Also, here's an example of how you may optionally override the default path (`angular/i18n/angular-locale_{{locale}}.js`) to the stored Angular i18n locale files in your project:

```
angular.module('myApp', ['tmh.dynamicLocale'])
  .config(function(tmhDynamicLocaleProvider) {
    tmhDynamicLocaleProvider.localeLocationPattern('/base/node_modules/angular-i18n/angular-locale_{{locale}}.js');
  });
```

## Development

### Requirements

0. Install [Node.js](http://nodejs.org/) and NPM (should come with)

1. Install global dependencies `grunt-cli` and `bower`:

    ```bash
    $ npm install -g grunt-cli bower
    ```

2. Install local dependencies:

    ```bash
    $ npm install
    ```

### Running the tests

```bash
$ grunt karma:unit
```
to run the test once

or

```bash
$ grunt karma:autotest
```
to run the tests continuously

