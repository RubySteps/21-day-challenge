##Emmet
Emmet is  a must have tool for any designer and web developer.
The [donwlaod page](http://emmet.io/download/) offers verious choices fir different editors, different platforms and other 3rd party support.

##How to use Emmet?


```
section#container>ul.nav>li.item*6>a[href="#"]{Click here!}  
```  

then tab and volla.

<section id="container">
  <ul class="nav">
    <li class="item"><a href="#">Click here!</a></li>
    <li class="item"><a href="#">Click here!</a></li>
    <li class="item"><a href="#">Click here!</a></li>
    <li class="item"><a href="#">Click here!</a></li>
    <li class="item"><a href="#">Click here!</a></li>
    <li class="item"><a href="#">Click here!</a></li>
  </ul>
</section>

The above code creates 6 `li` elements within the `ul` element that has a class `nav`. All of that within a `section` element with an `id` of `container`.

##Speed

I remember when I used to write table from scratch, uh, it was painful, but not any more. Check following abbreviation

```
table>tr#row$*2>td[colspan=2][cellpadding=20][cellspacing=0](60 characters)
```

magically will produce the following 360 characters.

<table>
	<tr id="row1">
		<td colspan="2" cellpadding="20" cellspacing="0"></td>
	</tr>
	<tr id="row2">
		<td colspan="2" cellpadding="20" cellspacing="0"></td>
	</tr>
	<tr id="row3">
		<td colspan="2" cellpadding="20" cellspacing="0"></td>
	</tr>
	<tr id="row4">
		<td colspan="2" cellpadding="20" cellspacing="0"></td>
	</tr>
	<tr id="row5">
		<td colspan="2" cellpadding="20" cellspacing="0"></td>
	</tr>
</table>
