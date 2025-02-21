
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Dr. Jan Kunkler"
#let locale-catalog-page-numbering-style = context { "Dr. Jan Kunkler - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Feb 2025"
#let locale-catalog-language = "en"
#let design-page-size = "a4"
#let design-section-titles-font-size = 1.2em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 0, 0)
#let design-section-titles-font-family = "XCharter"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.2em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.55cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "XCharter"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = false
#let design-header-name-font-family = "XCharter"
#let design-header-name-font-size = 25pt
#let design-header-name-bold = false
#let design-header-connections-font-family = "XCharter"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = false
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = "|"
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0cm
#let design-highlights-vertical-space-between-highlights = 0.19cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.3em
#let design-entries-vertical-space-between-entries = 0.4cm
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = false
#let design-links-underline = true
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Dr. Jan Kunkler

// Print connections:
#let connections-list = (
  [Regensburg, Germany],
  [#box(original-link("mailto:mail@jankunkler.de")[mail\@jankunkler.de])],
  [#box(original-link("tel:+49-160-95131829")[0160 95131829])],
  [#box(original-link("https://www.jankunkler.de/")[www.jankunkler.de])],
  [#box(original-link("https://linkedin.com/in/jankunkler")[linkedin.com\/in\/jankunkler])],
  [#box(original-link("https://github.com/jankunkler")[github.com\/jankunkler])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [AI leader and Principal Data Scientist specializing in enterprise AI strategy and implementation. Currently driving Vertical AI initiatives at Lobster, developing innovative solutions in GenAI, knowledge management, and intelligence orchestration. Combines technical expertise in machine learning with business acumen to deliver practical AI solutions. Active educator in AI and programming, with a PhD in data science and proven track record of bridging research and industry applications.]
)


== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[University of Regensburg], PhD in Supply Chain and Logistics -- Regensburg, DE
  ],
  right-content: [
    June 2020 – Feb 2023
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Machine Learning applications in logistics network optimization and sustainable transportation systems])], column-gutter: 0cm)

  #v(design-highlights-top-margin);#highlights([Developed novel machine learning models for road network performance prediction and optimization],[Published multiple peer-reviewed papers on sustainable city evaluation],[Led research initiatives in sustainable logistics and network performance optimization],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[University of Regensburg], MSc in Supply Chain Management -- Regensburg, DE
  ],
  right-content: [
    Sept 2017 – June 2019
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Specialized in data-driven decision making and quantitative methods for supply chain optimization])], column-gutter: 0cm)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Universität Trier], BSc in Business Administration -- Trier, DE
  ],
  right-content: [
    Sept 2013 – June 2017
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Focus on business intelligence and statistical analysis])], column-gutter: 0cm)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Principal Data Scientist], Lobster -- Tutzing, DE
  ],
  right-content: [
    June 2024 – present
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Spearheading data & AI strategy for enterprise data integration and process automation solutions])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed and implementing company-wide Vertical AI Strategy, aligning technology initiatives with business objectives],[Leading end-to-end development of mission-critical AI initiatives, directly reporting to CTO and CPO],[Developing AI-powered automation solutions including technical documentation generation \(SALMON\) and intelligent mapping systems \(MAPS\)],[Architected classification system \(CREW\) achieving 74\% F1 score and in-memory retrieval system \(SPLASH\)],[Establishing API-first centralized knowledge management system \(BRAIN\) for unified documentation and knowledge access],[Orchestrating collaboration between Data Center Cloud IT, Support, and Engineering teams],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Visiting Lecturer], OTH Regensburg -- Regensburg, DE
  ],
  right-content: [
    Oct 2024 – present
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Teaching fundamentals of programming and AI to Digital Business Management students])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developing practical curriculum combining Python programming and AI fundamentals],[Bridging business management and technology through industry-relevant instruction],[Fostering data-driven decision making and problem-solving skills],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Digital Solutions Manager], logistics cloud -- Tutzing, DE
  ],
  right-content: [
    Oct 2023 – June 2024
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Led digital transformation for cloud-based logistics platform serving major European transportation providers])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed platform connecting shippers, forwarders, carriers, and customs],[Implemented IoT tracking and blockchain services for supply chain transparency],[Established marketplace for predictive analytics and compliance services],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Postdoctoral Research Associate], University of Regensburg -- Regensburg, DE
  ],
  right-content: [
    Mar 2023 – Sept 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Served as Interim Chair for Controlling and Logistics],[Led M.Sc.\/B.Sc. programs with 250+ students],[Supervised research in city logistics and AI applications],[Developed advanced analytics curriculum for supply chain optimization],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Data Science Consultant], Freelance -- Regensburg, DE
  ],
  right-content: [
    Jan 2021 – Oct 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed freight tariffs for six prominent German Transportation Service Providers],[Collaborated with Prof. Dr. Andreas Otto on logistics optimization projects],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Co-Founder & Technical Lead], Braun & Kunkler GbR -- Burglengenfeld, DE
  ],
  right-content: [
    Jan 2020 – Apr 2022
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed award-winning RESET App for student self-regulation],[Collaborated with medical professionals on behavioral intervention strategies],[Led full-stack development including ML model integration],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Research Fellow], University of Regensburg -- Regensburg, DE
  ],
  right-content: [
    Sept 2019 – Mar 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Led research in ML applications for logistics network optimization],[Supervised 50+ theses in Supply Chain Management and AI],[Developed predictive models for transportation networks],[Integrated data science approaches into logistics research],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Various Positions], Early Career Experience -- Germany
  ],
  right-content: [
    Aug 2017 – Aug 2019
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Early career positions in research and industry])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Research Assistant at University of Regensburg \(2018-2019\): Supply Chain Management research and teaching],[Digital Solutions at Veolia Deutschland \(2017\): Implemented BizzPark app for business park management],)
  ],
)



== Skills


#one-col-entry(
  content: [#strong[AI Leadership:] AI Strategy Development, Enterprise AI Architecture, Cross-functional Team Leadership, AI Education & Mentorship]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[AI\/ML Expertise:] Large Language Models, Agentic AI, Multi-Agent Systems, Neural Networks, Machine Learning, MLOps]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Technical Infrastructure:] AWS \(SageMaker, Bedrock, Lambda, Fargate\), Cloud Architecture, Distributed Systems]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Data Engineering:] Knowledge Graphs, ETL Pipeline Design, Python, SQL, R, Go]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Tools & Frameworks:] PyTorch, LangChain, Hugging Face Transformers, BAML, Pydantic-AI, Docker, FastAPI, MLflow, Weights & Biases, Metaflow, Ray, Streamlit, Gradio]
)


== Publications & Books


#two-col-entry(
  left-content: [
    #strong[Road Network Performance Measurements \(Book\)]

  ],
  right-content: [
    Mar 2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Jan Kunkler]]

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.5283/EPUB.53802")[10.5283/EPUB.53802]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Sustainable City Evaluation Using the Database for Estimation of Road Network Performance]

  ],
  right-content: [
    Dec 2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Jan Kunkler]], Florian Kellner

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.3390/su15010733")[10.3390/su15010733]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Speed Limit Induced CO2 Reduction on Motorways: Enhancing Discussion Transparency through Data Enrichment of Road Networks]

  ],
  right-content: [
    Jan 2021
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Jan Kunkler]], Maximilian Braun, Florian Kellner

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.3390/su13010395")[10.3390/su13010395]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Towards Sustainable Cities: Utilizing Floating Car Data to Support Location-Based Road Network Performance Measurements]

  ],
  right-content: [
    Oct 2020
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Maximilian Braun, #strong[#emph[Jan Kunkler]], Florian Kellner

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.3390/su12198145")[10.3390/su12198145]])



