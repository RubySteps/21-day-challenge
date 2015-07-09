# 004-01

I tried [atom.io](https://atom.io/) the other day and I liked how easy it was to css-style the results, for instance to give a page of text a left margin, which feels easier when writing prose.

This led me to think about my ideal text-input-and-representer, and something I haven’t been getting from Emacs org-mode is multiple levels of indentation for prose as well as verse.  I can use

```emacs-lisp
#+begin_quote
	We shall then have a war between consciousness and nature, between the desire for permanence and the fact of flux. This war must be utterly futile and frustrating – a vicious circle – because it is a conflict between two parts of the same thing. It must lead thought and action into circles which go nowhere faster and faster. For when we fail to see that our life is change, we set ourselves against ourselves and become like Ouroboros, the misguided snake, who tries to eat his own tail. Ouroboros is the perennial symbol of all vicious circles, of every attempt to split our being asunder and make one part conquer the other.
#+end_quote
```

to indent prose in a way that will be exported as a single blockquote, and I can use

```emacs-lisp
#+begin_verse
	LENNOX
	  Sent he to Macduff?

	LORD
	  He did: and with an absolute 'Sir, not I,’
	  The cloudy messenger turns me his back,
	  And hums, as who should say 'You'll rue the time
	  That clogs me with this answer.’
#+end_verse
```

to indent verse so that multiple levels of indentation are preserved on export, but if I want to preserve multiple levels of indentation in prose, not verse, it doesn’t work.  With this:

```emacs-lisp
#+begin_verse
    CAESAR
      Do you hear?  These knockers at your gate are also believers in vengeance and in stabbing.  You have slain their leader: it is right that they shall slay you.  If you doubt it, ask your four counsellors here.  And then in the name of that right [_he emphasizes the word with great scorn_] shall I not slay them for murdering their Queen, and be slain in my turn by their countrymen as the invader of their fatherland?  Can Rome do less then than slay these slayers, too, to shew the world how Rome avenges her sons and her honour.  And so, to the end of history, murder shall breed murder, always in the name of right and honour and peace, until the gods are tired of blood and create a race that can understand.  [_Fiere uproar.  Cleopatra becomes white with terror_].  Hearken, you who must not be insulted.  Go near enough to catch their words: you will find them bitterer than the tongue of Pothinus.  [_Loftily, wrapping himself up in an impenetrable dignity_]  Let the Queen of Egypt now give her orders for vengeance, and take her measures for defence; for she has renounced Cæsar.  [_He turns to go_].

    CLEOPATRA [_terrified, running to him and falling on her knees_]
      You will not desert me, Cæsar.  You will defend the palace.
#+end_verse
```

The second (wrapped) line of Caesar’s speech will wrap back to be level with “CAESAR”, not with “Do you hear?”.

I can preserve the deeper indentation by calling `fill-paragraph` and having the whole thing formatted in Emacs, but then that same line-length is also fixed in the exported file, regardless of the width of the device I’m reading the exported file on.

```emacs-lisp
#+begin_verse
    CAESAR
      Do you hear?  These knockers at your gate are also believers in vengeance
      and in stabbing.  You have slain their leader: it is right that they shall
      slay you.  If you doubt it, ask your four counsellors here.  And then in
      the name of that right [_he emphasizes the word with great scorn_] shall I
      not slay them for murdering their Queen, and be slain in my turn by their
      countrymen as the invader of their fatherland?  Can Rome do less then than
      slay these slayers, too, to shew the world how Rome avenges her sons and
      her honour.  And so, to the end of history, murder shall breed murder,
      always in the name of right and honour and peace, until the gods are tired
      of blood and create a race that can understand.  [_Fiere uproar.
      Cleopatra becomes white with terror_].  Hearken, you who must not be
      insulted.  Go near enough to catch their words: you will find them
      bitterer than the tongue of Pothinus.  [_Loftily, wrapping himself up in
      an impenetrable dignity_] Let the Queen of Egypt now give her orders for
      vengeance, and take her measures for defence; for she has renounced Cæsar.
      [_He turns to go_].

    CLEOPATRA [_terrified, running to him and falling on her knees_]
      You will not desert me, Cæsar.  You will defend the palace.
#+end_verse
```

So what I would like is something that uses multiple indents but also distinguishes between prose and verse, so that the example above would end up like:

```html
<blockquote>CAESAR</blockquote>

<blockquote><blockquote>Do you hear? … [_He turns to go_].</blockquote></blockquote>

<blockquote>CLEOPATRA […]</blockquote>

<blockquote><blockquote>You will not desert me, Cæsar.  You will defend the palace.</blockquote></blockquote>
```

And similarly the verse example like:

```html
<blockquote>LENNOX</blockquote>

<blockquote><blockquote>Sent he to Macduff?</blockquote></blockquote>

<blockquote>LORD</blockquote>

<blockquote><blockquote>He did: and with an absolute 'Sir, not I,’<br/>
The cloudy messenger turns me his back,<br/>
And hums, as who should say 'You'll rue the time<br/>
That clogs me with this answer.’</blockquote></blockquote>
```

This is not good semantic markup: if we were putting in a whole play we’d want custom identifiers.  But for the initial use case of neatly formatting citations within citations (within, potentially, citations), this feels like a good start.

Without making any decisions about the app or the persistence layer, this html formatting / exporting feels like something that can be test-driven separately.  Let’s try that next.
