import {fileURLToPath} from 'url';
import {dirname} from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

export default {
    DEBUG: false,
    RICH_LOG_ENABLED: false,
    baseAppUrl: process.env.BASE_APP_URL || "http://localhost:8061",
    relativeStaticUrl: "/r",
    SKIP_IFRAMELY_RENDERS: true,
    GROUP_LINKS: true,
    MAX_REDIRECTS: parseInt(process.env.MAX_REDIRECTS, 10) || 4,
    SKIP_OEMBED_RE_LIST: [
        // /^https?:\/\/yourdomain\.com\//,
    ],

    /*
    GENERATE_LINK_PARAMS: {
        disableSizeWrapper: true
    },
    */

    port: 8061,
    host: '0.0.0.0',

    /*
    ssl: {
        key: ssl_key,
        cert: ssl_cert,
        port: 443
    },
    */

    CACHE_ENGINE: 'node-cache',
    CACHE_TTL: 0,

    /*
    allowedOrigins: [
        "*",
        "http://another_domain.com"
    ],
    */

    RESPONSE_TIMEOUT: 5 * 1000,

    ADD_OEMBED_PARAMS: [{
        re: [
            /^https:\/\/graph\.facebook\.com\/v[0-9\.]+\/instagram_oembed/i
        ],
        params: {
            // TODO: get your access Insagtam token as described
            // use `{app-id}|{app secret}` as access token
            // on https://developers.facebook.com/docs/instagram/oembed/
            access_token: '',
            hidecaption: true
        }
    }, {
        re: [/^https:\/\/graph\.facebook\.com\/v[0-9\.]+\/oembed_page/i],
        params: {
            // TODO: get your access token as described
            // use `{app-id}|{app secret}` as access token
            // on https://developers.facebook.com/docs/plugins/oembed
            access_token: '',
            show_posts: 0,
            show_facepile: 0,
            maxwidth: 600
        }
    }, {
        // match i=user or i=moment or i=timeline to configure these types invidually
        // see params spec at https://dev.twitter.com/web/embedded-timelines/oembed
        re: [/^https?:\/\/publish\.twitter\.com\/oembed\?i=user/i],
        params: {
            limit: 1,
            maxwidth: 600
        }
    }, {
        // Facebook https://developers.facebook.com/docs/plugins/oembed/
        re: [/^https:\/\/graph\.facebook\.com\/v[0-9\.]+\/oembed_/i],
        params: {
            // TODO: get your access token as described
            // use `{app-id}|{app secret}` as access token
            // on https://developers.facebook.com/docs/plugins/oembed
            access_token: '',
            // Add any other optional params, like skip script tag and fb-root div
            // omitscript: true
        }
    }],

    /*
    PROXY: [{
        re: [/^https?:\/\/www\.domain\.com/],

        // Either `proxy`, or `proxy_url`, or none.
        proxy: true,  // Will fetch URL via echo service configured as PROXY_URL. See below.
        // proxy_url: 'http://1.2.3.4:8080?url={url}', // Will fetch URL via this exact echo service, see below.

        user_agent: 'CHANGE YOUR AGENT',
        headers: {
            // HTTP headers
            // Overrides previous params if overlapped.
        },
        cache_ttl: 3600  // in seconds, cache response for 1 hour.
    }],

    // Proxy now requires an echo service endpoint.
    // See #354 and example code at
    // https://gist.github.com/nleush/7916ee89f7b8d6f0cd478d7335702139
    PROXY_URL: 'http://1.2.3.4:8080?url={url}',  // Iframely will add `?url=...` to this endpoint
    */

    providerOptions: {
        locale: "en_US",
        "twitter": {
            "max-width": 550,
            "min-width": 250,
            hide_media: false,
            hide_thread: false,
            omit_script: false,
            center: false,
            // dnt: true,
            cache_ttl: 100 * 365 * 24 * 3600
        },
        readability: {
            enabled: false
            // to enable description fallback to first paragraph
            // allowPTagDescription: true
        },
        images: {
            loadSize: false,
            checkFavicon: false
        },
        tumblr: {
            consumer_key: "INSERT YOUR VALUE"
            // disables status embeds for images and videos - will return plain media
            // media_only: true
        },
        google: {
            // https://developers.google.com/maps/documentation/embed/guide#api_key
            maps_key: "INSERT YOUR VALUE"
        },

        /*
        // Optional Camo Proxy to wrap all images: https://github.com/atmos/camo
        camoProxy: {
            camo_proxy_key: "INSERT YOUR VALUE",
            camo_proxy_host: "INSERT YOUR VALUE"
            // ssl_only: true // will only proxy non-ssl images
        },
        */

        youtube: {
            // api_key: "INSERT YOUR VALUE",
            // parts: [ "snippet", "player" ],
            get_params: "?rel=0&showinfo=1",
            fix_shorts_in_eu: true
        },
        vimeo: {
            get_params: "?byline=0&badge=0"
        },
        soundcloud: {
            old_player: true
        },
        giphy: {
            media_only: true
        },
        bandcamp: {
            get_params: '/size=large/bgcol=333333/linkcol=ffffff/artwork=small/transparent=true/',
            media: {
                album: {
                    height: 472,
                    'max-width': 700
                },
                track: {
                    height: 120,
                    'max-width': 700
                }
            }
        },
        // Docs: https://dev.twitch.tv/docs/embed/video-and-clips
        /*
        twitch: {
            parent: 'jsbin.com, null.jsbin.com, localhost'
        },
        */
    },


    /*
    WHITELIST_WILDCARD: {
          "twitter": {
            "player": "allow",
            "photo": "deny"
          },
          "oembed": {
            "video": "allow",
            "photo": "allow",
            "rich": "deny",
            "link": "deny"
          },
          "og": {
            "video": ["allow", "ssl", "responsive"]
          },
          "iframely": {
            "survey": "allow",
            "reader": "allow",
            "player": "allow",
            "image": "allow"
          },
          "html-meta": {
            "video": ["allow", "responsive"],
            "promo": "allow"
          }
    }
    */

    IGNORE_DOMAINS_RE: [
        /^https?:\/\/127\.0\.0\.1/i,
        /^https?:\/\/localhost/i,
        /^https?:\/\/[^\/]+:\d+\/?/,

        // And this is AWS metadata service
        // https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html
        /^https?:\/\/169\.254\.169\.254/
    ],

    // Endpoint for prerender service, if you need it. Used to parse React apps. Very slow.
    // Tested with https://github.com/prerender/prerender
    // PRERENDER_URL: "https://domain/render?url="
};
