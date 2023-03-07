<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Sites
    |--------------------------------------------------------------------------
    |
    | Each site should have root URL that is either relative or absolute. Sites
    | are typically used for localization (eg. English/French) but may also
    | be used for related content (eg. different franchise locations).
    |
    */

    'sites' => [

        'english' => [
            'name' => config('app.name'),
            'locale' => 'en_US',
            'url' => '/',
        ],

        'belgian-dutch' => [
            'name' => 'belgian-dutch',
            'locale' => 'nl_BE',
            'url' => env('APP_URL') . 'be/nl_BE/',
        ],

        'belgian-french' => [
            'name' => 'belgian-french',
            'locale' => 'fr_BE',
            'url' => env('APP_URL') . 'be/fr_BE/',
        ],

        'dutch' => [
            'name' => 'dutch',
            'locale' => 'nl_NL',
            'url' => env('APP_URL') . 'nl/',
        ],

    ],
];
