@import 'compass/reset';
@import url(https://fonts.googleapis.com/css?family=Open+Sans:700,300);
$base-font: 'Open Sans', sans-serif;
$height: 26em;
$factor: 1.618;
$duration: .6s;
$red: #FF3B99;
$blue: #5eb9cc;
$green: #B2FF41;
$orange: #FF9D00;
$textColor: #444;

body
{
    font-family: $base-font;
    font-size: 16px;

    text-align: center;

    color: $textColor;
    background: #d0d0d0;
}

header
{
    margin-bottom: 2em;
}

h1
{
    font-size: 2em;

    margin: 2em 0 1em;
}

strong
{
    font-weight: 700;
}
p
{
    line-height: 1.4em;
}
article header
{
    margin: 0;
}

.full-height
{
    height: $height;
    align-items: center;
}
.flexy-item
{
    display: flex;
    flex-direction: row;
    justify-content: center;
    position: relative;
}
.flexy-column
{
    flex-direction: column;
    &.reverse
    {
        flex-direction: column-reverse;
    }
}
.flexy-item_child
{
    flex: 1 0 100%;
}

.pure-steps
{
    display: inline-block;
    width: 20em;
    color: white;
    margin-bottom: 3em;
    strong
    {
        color: $green;
        font-weight: 300;
    }
    .pure-steps_group
    {
        position: relative;
        min-height: $height;
        border-radius: .4em;
        overflow: hidden;
        box-shadow: 0 1.7em 5.5em -.94em rgba(black, .3), 0 2em 3em .5em rgba(black, .1), 0 1.8em 2em -1.5em rgba(black, .2);
        background-image: linear-gradient(-120deg, #26E289 0, #1a5fa2 100%, red 200%);
        background-position: 0 0;
        background-size: 300%;
        will-change: background, box-shadow;
        transition: all ($duration / 2) ease-out;
        .pure-steps_group-step
        {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            transform: translate(100%);
            opacity: 0;
            will-change: transform, opacity;
            transition: all $duration ease-in-out;
            text-align: left;
            &:last-child
            {
                text-align: center;
            }
             .pure-steps_group-step_legend
             {
                font-size: 1.5em;
                font-weight: 700;
                padding: 1.5em 1.34em 1em;
                line-height: 1em;
                position: relative;
             }
             .pure-steps_group-step_item
             {
                padding: 0 2em 1em;
                label
                {
                    font-size: .8em;
                    display: block;
                    // padding-bottom: .6em;
                    opacity: .6;
                }
                input
                {
                    font-size: 1em;
                    box-sizing: border-box;
                    width: 100%;
                    border: 0;
                    line-height: 1.5em;
                    background-color: transparent;
                    background-image:   linear-gradient(0deg, transparent 0, #e5e5e5 1px),
                                        linear-gradient(0deg, transparent 0, #B2FF41 1px);
                    background-size: 100% 1px, 0% 1px;
                    background-repeat: no-repeat;
                    outline: none;
                    will-change: background;
                    transition: background ($duration / 2) ease-in-out;
                    color: white;
                    font-family: $base-font;
                    font-weight: 300;
                    $placeholderColor: rgba(white, .6);
                    &:focus
                    {
                        color: white;
                        background-size: 0% 1px, 100% 1px;

                        &+ label
                        {
                            opacity: 1;
                            color: $green;
                        }
                    }
                    &::-webkit-input-placeholder
                    {
                       color: $placeholderColor;
                    }

                    &:-moz-placeholder
                    { /* Firefox 18- */
                       color: $placeholderColor;  
                    }

                    &::-moz-placeholder
                    {  /* Firefox 19+ */
                       color: $placeholderColor;  
                    }

                    &:-ms-input-placeholder
                    {  
                       color: $placeholderColor;  
                    }
                }

             }
        }
    }

    .pure-steps_radio
    {
        display: none;
    }
    .pure-steps_group-triggers
    {
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        height: 3.6em;
        border-radius: 0 0 .4em .4em;
        background-color: rgba(black, .1);
        will-change: opacity;
        transition: opacity ($duration / 2) ease-in-out;
        &:before
        {
            content: '';
            display: inline-block;
            position: absolute;
            left: 0;
            width: 0%;
            height: .1em;
            background: rgba($green, .4);
            will-change: width;
            transition: width $duration ease-in-out;
        }
        .pure-steps_group-triggers_item
        {
            display: none;
            label
            {
                display: block;
                padding: 1.2em;
                color: white;
            }
        }
    }
    
    $pureSteps: 4; // staring index: 1
    @for $i from 1 to $pureSteps
    {
        .pure-steps_radio:nth-child(#{$i}):checked ~ .pure-steps_group
        {
            $bgPosition: (100 / $pureSteps) * $i;
            background-position: ($bgPosition * 1%) 0;
            @if $i == ($pureSteps - 1) {
                .pure-steps_group-triggers
                {
                    opacity: 0;
                    transition-delay: $duration;
                }
                .pure-steps_group-step
                {
                    align-items: center;
                    height: 100%;
                    .pure-steps_preload
                    {
                        display: block;
                        height: .1em;
                        width: 100%;
                        box-sizing: border-box;
                        margin: 0 2em;
                        background-image: linear-gradient(0deg, rgba($red, .4) 0%, rgba($orange, .4) 50%, rgba($green, .4) 100%);
                        background-size: 0 10em;
                        background-position: top center;
                        background-repeat: no-repeat;
                        will-change: background-image;
                        transition: background-image 3s linear;

                        animation: preloadLine 3s ease-out forwards;

                        svg
                        {
                            font-size: 1.2em;
                            width: auto;
                            height: 1em;
                            padding: 1em;
                            border-radius: 2em;
                            background-color: #5BD670;
                            fill: white;
                            margin-top: -1.5em;
                            transform: scale(0);
                            animation: preloadTic .8s linear forwards;
                            animation-delay: 3s;
                        }
                    }
                }
            }
            .pure-steps_group-triggers
            {
                &:before
                {
                    width: 33.333% * $i;
                }
                .pure-steps_group-triggers_item:nth-child(#{$i+1})
                {
                    display: block;
                }
            }
        }
        .pure-steps_radio:nth-child(#{$i}):checked ~ .pure-steps_group .pure-steps_group-step:nth-child(#{$i})
        {
            opacity: 1;
            transform: translate(0);
        }
    }        
}

@keyframes preloadLine
{
    0%
    {
        background-position: bottom center;
        background-size: 0 10em;
    }
    100%
    {
        background-position: top center;
        background-size: 100% 10em;
    }
}
@keyframes preloadTic
{
    0%
    {
        transform: scale(0);
    }
    20%
    {
        transform: scale(.2);
        animation-timing-function: ease-out;
    }
    50%
    {
        transform: scale(1.3);
        animation-timing-function: ease-in;
    }
    65%
    {
        transform: scale(.9);
        animation-timing-function: ease-out;
    }
    80%,
    100%
    {
        transform: scale(1);
    }
}
