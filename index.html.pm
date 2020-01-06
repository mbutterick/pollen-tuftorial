#lang pollen

◊title{Pollen Tuftorial
Matthew Butterick}

◊section{
Tufte CSS provides tools to style web articles using the ideas demonstrated by Edward Tufte's books and handouts. Tufte's style is known for its simplicity, extensive use of sidenotes, tight integration of graphics with text, and carefully chosen typography.

Tufte CSS was created by ◊link["http://www.daveliepmann.com"]{Dave Liepmann} and is now an Edward Tufte project.

Tufte CSS is merely a sketch of one way to implement this particular set of ideas. It should be a starting point, not a design goal, because any project should present their information as best suits their particular circumstances.
}

◊section-h2{
Getting started

To use Tufte CSS, copy ◊${tufte.css} and the ◊${et-book} directory of font files to your project directory, then add the following to your HTML document's ◊${head} block:

◊$${<link rel="stylesheet" href="tufte.css"/>}

Now you just have to use the provided CSS rules, and the Tufte CSS conventions described in this document. For best results, View Source and Inspect Element frequently.
}

◊section-h2{
Fundamentals

Organize your document with an ◊${article} element inside your ◊${body} tag. Inside that, use ◊${section} tags around each logical grouping of text and headings.

◊blockquote[#:cite "http://www.edwardtufte.com/bboard/q-and-a-fetch-msg?msg_id=0000hB"]{[It is] notable that the Feynman lectures (3 volumes) write about all of physics in 1800 pages, using only 2 levels of hierarchical headings.

It also uses the methodology of sentences which then cumulate sequentially into paragraphs, rather than the grunts of bullet points. 

Edward Tufte, forum post, 'Book design: advice and examples' thread}

◊newthought{In his later books}◊sidenote{◊link["http://www.edwardtufte.com/tufte/books_be"]{◊em{Beautiful Evidence}}}, Tufte starts each section with a bit of vertical space, a non-indented paragraph, and the first few words of the sentence set in small caps.
}

◊section-h3{
Text

In print, Tufte has used the proprietary Monotype Bembo◊sidenote{See Tufte's comment in the ◊link["http://www.edwardtufte.com/bboard/q-and-a-fetch-msg?msg_id=0000Vt"]{Tufte book fonts} thread.} font. A similar effect is achieved in digital formats with the now open-source ◊link["https://github.com/edwardtufte/et-book"]{ETBook}, which Tufte CSS supplies with a ◊code{@font-face} reference to a ◊code{.ttf} file. In case ETBook somehow doesn't work, Tufte CSS shifts gracefully to other serif fonts like Palatino and Georgia.

Also notice how Tufte CSS includes separate font files for ◊strong{bold} (strong) and ◊em{italic} (emphasis), instead of relying on the browser to mechanically transform the text. This is typographic best practice.

◊sans{If you prefer sans-serifs, use the ◊code{sans} class. It relies on Gill Sans, Tufte's sans-serif font of choice.}

Links in Tufte CSS match the body text in color and do not change on mouseover or when clicked. Here is a ◊link["#"]{dummy example} that goes nowhere. ◊marginnote{Blue text, while also a widely recognizable clickable-text indicator, is crass and distracting. Luckily, it is also rendered unnecessary by the use of underlining.} However, because most browsers' default underlining does not clear descenders and is so thick and distracting, the underline effect is instead achieved using CSS trickery involving background gradients instead of standard ◊code{text-decoration}.
}

◊section-h2{
Epigraphs

◊epigraph{The English language . . . becomes ugly and inaccurate because our thoughts are foolish, but the slovenliness of our language makes it easier for us to have foolish thoughts.

George Orwell, "Politics and the English Language"}

◊epigraph{For a successful technology, reality must take precedence over public relations, for Nature cannot be fooled.

Richard P. Feynman, ◊em{"What Do You Care What Other People Think?"}}

◊epigraph{I do not paint things, I paint only the differences between things.

Henri Matisse, ◊em{Henri Matisse Dessins: thèmes et variations} (Paris, 1943), 37}

If you’d like to introduce your page or a section of your page with some quotes, use epigraphs.

}


◊section-h2{
Figures

Figures should try to use the ◊code{figure} element, which by default are constrained to the main column. Don't wrap figures in a paragraph tag. Any label or margin note goes in a regular margin note inside the figure. For example, most of the time one should introduce a figure directly into the main flow of discussion, like so:

◊figure[#:src "tufte-css/img/exports-imports.png" 
#:alt "Exports and Imports to and from Denmark & Norway from 1700 to 1780"]{
◊marginnote{From Edward Tufte, ◊em{Visual Display of Quantitative Information}, page 92.}
}

◊marginnote{◊img[#:src "tufte-css/img/rhino.png" #:alt "Image of a Rhinoceros"] F.J. Cole, "The History of Albrecht Dürer’s Rhinoceros in Zooological Literature," ◊em{Science, Medicine, and History: Essays on the Evolution of Scientific Thought and Medical Practice} (London, 1953), ed. E. Ashworth Underwood, 337-356. From page 71 of Edward Tufte’s ◊em{Visual Explanations}.} But tight integration of graphics with text is central to Tufte's work even when those graphics are ancillary to the main body of a text. In many of those cases, a margin figure may be most appropriate. To place figures in the margin, just wrap an image (or whatever) in a margin note inside a ◊code{p} tag, as seen to the right of this paragraph.

If you need a full-width figure, give it the ◊code{fullwidth} class. Make sure that's inside an ◊code{article}, and it will take up (almost) the full width of the screen. This approach is demonstrated below using Edward Tufte's English translation of the Napoleon’s March data visualization. From ◊em{Beautiful Evidence}, page 122-124.

◊figure-fullwidth[
#:src "tufte-css/img/napoleons-march.png" 
#:alt "Figurative map of the successive losses of the French Army in the Russian campaign, 1812-1813"]

One obstacle to creating elegant figures on the web is the difficulty of handling different screen sizes, especially on the fly. Embedded iframe elements are particularly troublesome. For these instances we provide a helper class, iframe-wrapper, the most common use for which is probably YouTube videos, e.g.

◊youtube[#:id "YslQ2625TR4"]

}


◊section-h2{
ImageQuilts

Tufte CSS provides support for Edward Tufte and Adam Schwartz’s ◊link["http://imagequilts.com/"]{ImageQuilts}. See the ◊link["http://www.edwardtufte.com/bboard/q-and-a-fetch-msg?msg_id=0003wk"]{ET forum announcement thread} for more on quilts. Some have ragged edges, others straight. Include these images just as you would any other ◊code{figure}.

This is an ImageQuilt surveying Chinese calligraphy, placed in a full-width figure to accomodate its girth:

◊figure-fullwidth[#:src "tufte-css/img/imagequilt-chinese-calligraphy.png" 
#:alt "Image of Chinese Calligraphy"]

Here is an ImageQuilt of 47 animal sounds over and over, in a figure constrained to the main text region. This quilt has ragged edges, but the image itself is of course still rectangular.

◊figure[#:src "tufte-css/img/imagequilt-animal-sounds.png"
#:alt "Image of animal sounds"]

}
