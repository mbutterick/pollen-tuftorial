#lang pollen

◊title{Pollen Tuftorial
Matthew Butterick}

◊section{
Tufte CSS provides tools to style web articles using the ideas demonstrated by Edward Tufte's books and handouts. Tufte's style is known for its simplicity, extensive use of sidenotes, tight integration of graphics with text, and carefully chosen typography.

Tufte CSS was created by ◊link["http://www.daveliepmann.com"]{Dave Liepmann} and is now an Edward Tufte project. The original idea was cribbed from ◊link["https://tufte-latex.github.io/tufte-latex/"]{Tufte-LaTeX} and ◊link["http://rmarkdown.rstudio.com/tufte_handout_format.html"]{R Markdown's Tufte Handout format}. We give hearty thanks to all the people who have contributed to those projects.

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

◊newthought{In his later books}, Tufte starts each section with a bit of vertical space, a non-indented paragraph, and the first few words of the sentence set in small caps.
}

