
Read CSS Wizardry code to create width classes dynamically and thought... could do with some of that.

````
///*----------------------------------------------------------------------*\
// #WIDTHS
//
// CSS Wizardry with math way of creating css classes
// https://github.com/inuitcss/tools.widths/blob/master/_tools.widths.scss
//
//\*----------------------------------------------------------------------*/

// A mixin to spit out our width classes. Pass in the columns we want the widths
// to have, and an optional suffix for responsive widths. E.g. to create thirds
// and quarters for a small breakpoint:
//
// @include widths(3 4);

// Build classes in the format `.width-3-4`
@mixin widths($widths-columns) {

  @each $width-denominator in $widths-columns {

    @for $width-numerator from 1 through $width-denominator {

      .width-#{$width-numerator}-#{$width-denominator} {
        width: ($width-numerator / $width-denominator) * 100%;
      }
    }
  }
}
````