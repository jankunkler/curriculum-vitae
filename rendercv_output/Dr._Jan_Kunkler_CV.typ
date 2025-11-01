
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Dr. Jan Kunkler"
#let locale-catalog-page-numbering-style = context { "Dr. Jan Kunkler - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Nov 2025"
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
  [Straubing, Germany],
  [#box(original-link("mailto:mail@jankunkler.de")[mail\@jankunkler.de])],
  [#box(original-link("tel:+49-160-95131829")[0160 95131829])],
  [#box(original-link("https://linkedin.com/in/jankunkler")[linkedin.com\/in\/jankunkler])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [Principal AI Engineer building production agentic AI systems for enterprise data integration and EDI. Leading development of Pathfinder AI copilot serving 2000+ companies in supply chain and logistics. Established AI strategy, infrastructure, and team from scratch. Background spans research \(PhD in data science focusing on ML applications in logistics\), academia, and industry. Focus on building reliable AI systems that support critical business processes, combining technical implementation with cross-functional leadership.]
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

  #v(design-highlights-top-margin);#highlights([Developed machine learning models for road network performance prediction and optimization],[Published peer-reviewed papers on sustainable city evaluation],[Research on sustainable logistics and network performance optimization],)
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

  #v(design-highlights-top-margin);#highlights([Master Thesis: Developed ResNet-based computer vision system analyzing satellite imagery for logistics performance prediction],[Built end-to-end ML pipeline for estimating delivery times based on infrastructure analysis],[Combined computer vision with logistics domain knowledge to enhance shipment planning],)
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
    #strong[Principal AI Engineer], Lobster -- Tutzing, DE
  ],
  right-content: [
    Mar 2025 – present
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Leading development of Pathfinder, an AI copilot for enterprise EDI and data integration platform coordinating data across global supply chains. Building and scaling agentic AI infrastructure and Team Caprica to support production systems serving companies including HARIBO, Hermes, HP, Coop, Lindt & Sprüngli, and Logwin.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Built Pathfinder from architecture to production deployment, serving 2000+ companies in supply chain and logistics with context-aware assistance for EDI workflows and data orchestration],[Designed and implemented scalable agentic AI microservice infrastructure using LangGraph, pydantic\_ai, DSPy, MCP, and Google's A2A protocol for composable multi-agent systems],[Built and mentor Team Caprica, recruiting 3 AI Engineers through full technical interview and assessment process],[Delivered keynote \"From Data to Intelligence - The Future of Supply Chains\" at Lobster Data Hero Summit with AWS Head of Technology and AI startup leaders],[Built internal automation including HubSpot data enrichment pipeline and chatbot replacement, reducing manual effort and improving response quality],[Coordinate with stakeholders across business units including CTO and CPO, leading AI enablement and participating in Engineering Management],[Published articles on agentic AI and data integration for Illuminaire, TechRadar, Supply Chain Strategy, and DIGITALE WELT],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Principal Data Scientist], Lobster -- Tutzing, DE
  ],
  right-content: [
    May 2024 – Feb 2025
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Joined as first AI practitioner to establish AI strategy and technical foundation. Researched and defined approach for enterprise AI implementation.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed company-wide AI strategy from scratch, working with C-Level to define vision and align initiatives with business objectives],[Researched and evaluated AI frameworks, tools, and infrastructure to establish technical foundation for production systems],[Designed initial AI solutions including automated technical documentation generation, intelligent data mapping systems, classification models, and semantic knowledge retrieval],[Established architecture for API-first knowledge management system enabling unified documentation access],[Built collaboration framework between Data Center Cloud IT, Support, and Engineering teams for AI integration],[Represented AI initiatives at industry conferences and technical forums],)
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

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed practical curriculum combining Python programming and AI fundamentals],[Teaching business management students technical skills for data-driven decision making],[Focus on industry-relevant applications and problem-solving approaches],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Digital Solutions Manager], Lobster Logistics Cloud -- Tutzing, DE
  ],
  right-content: [
    Oct 2023 – May 2024
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Built Customer Success function for managed EDI and collaboration network \(Lobster subsidiary, now Lobster Data Network\). Managed custom integration projects and consulted on backend architecture improvements.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Built Customer Success team from scratch, recruiting and training 5 team members before transitioning to Principal Data Scientist role],[Managed custom integration projects for logistics providers within managed service network built on Lobster ecosystem],[Internal consulting with tech lead on backend architecture to support growing customer requirements],[Sales engineering and technical consulting for platform capabilities, working with shippers, forwarders, carriers, and customs agencies],[Supported platform connecting IoT tracking, blockchain services, and predictive analytics for supply chain transparency],)
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
    #v(design-highlights-top-margin);#highlights([Developed freight tariffs for six German Transportation Service Providers],[Worked with Prof. Dr. Andreas Otto on logistics optimization projects],)
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
    #v(design-highlights-top-margin);#highlights([Developed RESET App for student self-regulation],[Worked with medical professionals on behavioral intervention strategies],[Full-stack development including ML model integration],)
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
    #v(design-highlights-top-margin);#highlights([Research on ML applications for logistics network optimization],[Supervised 50+ theses in Supply Chain Management and AI],[Developed predictive models for transportation networks],[Applied data science approaches to logistics research],)
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
  content: [#strong[AI Leadership:] AI Strategy Development, Enterprise AI Architecture, Team Building & Mentorship, Stakeholder Management, Technical Vision]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[AI\/ML Expertise:] Agentic AI Systems, Large Language Models, Multi-Agent Systems, Computer Vision, Neural Networks \(ResNet, Transformers\), Machine Learning, MLOps]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Technical Infrastructure:] AWS \(SageMaker, Bedrock, Lambda, Fargate\), Cloud Architecture, Microservices, Distributed Systems]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Data Engineering:] Knowledge Graphs, ETL Pipeline Design, Python, SQL, R, Go]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[AI Frameworks & Tools:] LangGraph, pydantic\_ai, DSPy, LangChain, PyTorch, Hugging Face Transformers, BAML, FastAPI, Docker]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[AI Protocols & Standards:] Model Context Protocol \(MCP\), Agent-to-Agent Protocol \(A2A\), API Design]
)


== Articles & Media


#two-col-entry(
  left-content: [
    #strong[Why agentic AI will not replace your team, it might help you grow it]

  ],
  right-content: [
    Aug 2025
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Jan Kunkler]]

#v(design-highlights-top-margin - design-text-leading)#link("https://illuminaire.io/why-agentic-ai-will-not-replace-your-team-it-might-help-you-grow-it/")[illuminaire.io/why-agentic-ai-will-not-replace-your-team-it-might-help-you-grow-it] (Illuminaire)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Agentische KI als Treiber der Personalentwicklung und individuellen Performance]

  ],
  right-content: [
    July 2025
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Jan Kunkler]]

#v(design-highlights-top-margin - design-text-leading)#link("https://digitaleweltmagazin.de/agentische-ki-als-treiber-der-personalentwicklung-und-individuellen-performance/")[digitaleweltmagazin.de/agentische-ki-als-treiber-der-personalentwicklung-und-individuellen-performance] (DIGITALE WELT Magazin)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Beyond algorithms: Agentic AI and the behavioral data scientist]

  ],
  right-content: [
    June 2025
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Jan Kunkler]]

#v(design-highlights-top-margin - design-text-leading)#link("https://www.techradar.com/pro/beyond-algorithms-agentic-ai-and-the-behavioral-data-scientist")[www.techradar.com/pro/beyond-algorithms-agentic-ai-and-the-behavioral-data-scientist] (TechRadar)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[The agent-driven supply chain: rethinking logistics with collaborative AI]

  ],
  right-content: [
    June 2025
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Jan Kunkler]]

#v(design-highlights-top-margin - design-text-leading)#link("https://supplychainstrategy.media/blog/2025/06/06/the-agent-driven-supply-chain-rethinking-logistics-with-collaborative-ai/")[supplychainstrategy.media/blog/2025/06/06/the-agent-driven-supply-chain-rethinking-logistics-with-collaborative-ai] (Supply Chain Strategy)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[From Data to Intelligence - The Future of Supply Chains]

  ],
  right-content: [
    May 2025
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Jan Kunkler]]

#v(design-highlights-top-margin - design-text-leading)#link("https://www.youtube.com/watch?v=C6HI1xjnL0Y&list=PLOy4YubRIzq9Vwc1LHVj29xgOdEOteqK6&index=2")[www.youtube.com/watch?v=C6HI1xjnL0Y&list=PLOy4YubRIzq9Vwc1LHVj29xgOdEOteqK6&index=2] (Lobster Data Hero Summit \(Keynote\))])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Roll call: How agentic AI is growing headcount and enabling employee success]

  ],
  right-content: [
    Apr 2025
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Jan Kunkler]]

#v(design-highlights-top-margin - design-text-leading)#link("https://aijourn.com/roll-call-how-agentic-ai-is-growing-headcount-and-enabling-employee-success/")[aijourn.com/roll-call-how-agentic-ai-is-growing-headcount-and-enabling-employee-success] (The AI Journal)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Die Rolle von Agentic AI in der Unternehmens-IT der Zukunft]

  ],
  right-content: [
    Apr 2025
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Jan Kunkler]]

#v(design-highlights-top-margin - design-text-leading)#link("https://www.bigdata-insider.de/die-rolle-von-agentic-ai-in-der-unternehmens-it-der-zukunft-a-d376e9d58a00b81050ebcc0a16da6ad2/")[www.bigdata-insider.de/die-rolle-von-agentic-ai-in-der-unternehmens-it-der-zukunft-a-d376e9d58a00b81050ebcc0a16da6ad2] (BigData-Insider)])



== Books


#two-col-entry(
  left-content: [
    #strong[Road Network Performance Measurements]

  ],
  right-content: [
    Mar 2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Jan Kunkler]]

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.5283/EPUB.53802")[10.5283/EPUB.53802]])



== Peer-reviewed Publications


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



