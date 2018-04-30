Admin.create!([
  {full_name: "admin project", email: "blealf@gmail.com", tel: "+44", password_digest: "$2a$10$Qsh.kiAt0g9i9RfbItEx8u./l8BTSTuPqqHXYKYjsmi7QUuQ7WXTG", pnumber: "p1000000", remember_digest: nil}
])
About.create!([
  {title: "The Project Search System", description: "This system is built to help students to search for projects put up by staff members conveniently. to experience and benefit from the full functionality of this system it is necessary to be logged in. When logged in, the system can recommend projects to the students based on the interests indicated. Students can make a shortlist of project and they will be saved and can be viewed anytime once logged in. \r\nAdditionally, Students will be able to apply to project that they seem to like and feel competent in. Applying through this system established a communication between the student and the staff member involved. For convenience, all applications and chatting withing this system are sent to the emails of those involved.\r\nStudent feedback is highly needed for the further improvement of this system so we encourage students to always send feedback."}
])

Category.create!([
  {category_name: "Research"},
  {category_name: "Development"},
  {category_name: "Conceptual"},
  {category_name: "Consultancy"}
])
Faculty.create!([
  {faculty_name: "Arts, Design and Humanities"},
  {faculty_name: "Business and Law"},
  {faculty_name: "Health and Life Sciences"},
  {faculty_name: "Technology"},
  {faculty_name: "Institute of Energy and sustainable Development"},
  {faculty_name: "Institute of Creative Technologies"}
])
Level.create!([
  {level_name: "Masters"},
  {level_name: "Undergraduate"},
  {level_name: "Undergraduate and Masters"}
])
ProjectTag.create!([
  {tag_name: "OOP"},
  {tag_name: "Artificial Intelligence"},
  {tag_name: "Java"},
  {tag_name: "JSP"},
  {tag_name: "Web Interface Design"},
  {tag_name: "PHP"},
  {tag_name: "Psychology"},
  {tag_name: "Software engineering"},
  {tag_name: "Smalltalk"},
  {tag_name: "Systems Analysis and Design"},
  {tag_name: "Database"},
  {tag_name: "Functional Language"},
  {tag_name: "Game Development"},
  {tag_name: "HTML + CSS"},
  {tag_name: "GUI"},
  {tag_name: "Human Computer Interaction"},
  {tag_name: "XHTML or XML"},
  {tag_name: "C#"},
  {tag_name: "C++"},
  {tag_name: "VB.net"},
  {tag_name: "Business Modelling"}
])
SupervisionType.create!([
  {name: "Main supervisor"},
  {name: "Second supervisor"}
])
Department.create!([
  {department_name: "Leicester Castle Business School", faculty_id: 2},
  {department_name: "Leicester Media School", faculty_id: 4},
  {department_name: "School of Computer Science and Informatics", faculty_id: 4},
  {department_name: "School of Engineering and Sustainable Development", faculty_id: 4},
  {department_name: "Leicester Business School", faculty_id: 2},
  {department_name: "Leicester De Montfort Law School", faculty_id: 2},
  {department_name: "Leicester School of Architecture", faculty_id: 1},
  {department_name: "School of Arts", faculty_id: 1},
  {department_name: "School of Design", faculty_id: 1},
  {department_name: "School of Humanities", faculty_id: 1},
  {department_name: "Department of Politics and Public policy", faculty_id: 2},
  {department_name: "School of Applied Health Sciences", faculty_id: 3},
  {department_name: "School of Applied Social Sciences", faculty_id: 1},
  {department_name: "School of Nursing and Midwifery", faculty_id: 3},
  {department_name: "Leicester School of Pharmacy", faculty_id: 3}
])
Course.create!([
  {course_name: "Information Systems Management", department_id: 3},
  {course_name: "Software engineering", department_id: 3},
  {course_name: "Computing ", department_id: 3},
  {course_name: "Forensic Accounting", department_id: 5},
  {course_name: "Intelligent Systems", department_id: 3},
  {course_name: "Intelligent Systems and Robotics", department_id: 3},
  {course_name: "Sustainable Business", department_id: 5},
  {course_name: "Forensic computing", department_id: 3},
  {course_name: "Global Banking and Finance", department_id: 1},
  {course_name: "Global Finance and Investment", department_id: 1},
  {course_name: "Cyber Security ", department_id: 3},
  {course_name: "Computer Games Programming", department_id: 3},
  {course_name: "Computer Science", department_id: 3},
  {course_name: "Business Intelligence Systems and Data Mining ", department_id: 3}
])
Staff.create!([
  {first_name: "Stephanie", last_name: "Alfred", email: "blealfred92@gmail.com", password_digest: "$2a$10$uo70KT4OzdpoiQrDkQp6d.1HUMRmoBzHAGXWqUQZxcRZjPkRRmPA6", office_tel: "+44", profile: "", department_id: 6, pnumber: "p10030033", remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
  {first_name: "Ben", last_name: "Passow", email: "benpassow@ieee.org", password_digest: "$2a$10$2Ok8/A2XKUEt7/C.c2s.memZUuk9OTdYN.CGB83rrDsywqUqEFybe", office_tel: "8503", profile: "http://tech.dmu.ac.uk/~benpassow", department_id: 3, pnumber: "p11111111", remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
  {first_name: "Stephanie", last_name: "Alex", email: "blealf@gmail.com", password_digest: "$2a$10$INQ89bi6S5Nqwhqrbn/iJeD2yZszAlEwVHirpcZacIQhvh6E.VKXi", office_tel: "9898", profile: "http://www.wikipedia.org", department_id: 3, pnumber: "p10050030", remember_digest: nil, reset_digest: nil, reset_sent_at: nil}
])
Student.create!([
  {full_name: "Blairson Alfred", email: "batrainnovations@gmail.com", password_digest: "$2a$10$qT4k21EYai5xBCsOJWOaxeHscoKKlQRJ3jwxT8IqrmrFpOZX8deru", course_id: 2, additional_interest: "", level_id: 1, pnumber: "p15237108", remember_digest: nil},
  {full_name: "Adeyemi Samuel", email: "psalmmiefresh@gmail.com", password_digest: "$2a$10$0pHD8p/qoidc8WoCkYVwXeOg56f.hqhUDj4MQObjfvTOQEfv2B4z6", course_id: 2, additional_interest: "Human Factors design, Database management", level_id: 1, pnumber: "P1231759", remember_digest: nil},
  {full_name: "davion ", email: "davion 111@yahoo.com", password_digest: "$2a$10$7Thg7O5esh.R6SADFfuIku11W/XMcW6ia6F5W3Ik5VvvTlVDfoLt6", course_id: 2, additional_interest: "pundit", level_id: 1, pnumber: "p102667", remember_digest: nil}
])

Project.create!([
  {title: "Social functions of academic publishing", description: "Brief Description\r\n\r\nScientists and other academic researchers rely on reading papers published in journals and in conference proceedings and other edited books. And they rely absolutely for career advancement on getting their own work published in journals, books and conferences. But electronic distribution of academic research papers and other documents is fast becoming vitally important to research. In some fields, including large areas of Physics, you can't keep up if you're not aware of new results long before they're published in journals. Even in slower-moving disciplines, journals and books (and inter-library loans) are very expensive. Most researchers rely on Google to find papers, by knowing which authors to look at, and by trying lots of astute keyword searches, and often get papers from the authors' own websites.\r\n\r\nSo how can academic publishing work? The traditional business model, in which readers (or their libraries) pay for access to books and journals which are published as commercial ventures that publish articles for free, is breaking. Printed copies of journals get looked at less and less, and libraries are always seeking to save money by cancelling journal subscriptions.\r\n\r\nWhat are the alternatives? Lots of journals now have websites, and libraries increasingly pay for electronic access without keeping physical copies. But few electronic-only journals have thrived - and the actual printing and distribution of physical copies is only a small fraction of the cost of publishing a journal issue. Is the idea of a journal making money from subscriptions obsolete? Is author-pays a more viable model? Or is the traditional academic journal itself on the way out? Are there better ways to organize, manage and quality-control the publication of academic papers?\r\n\r\nTo address these questions, it's essential to recognise that making papers available to the people who might want to read them is only one of several social functions performed by publication in journals, books and conference proceedings. Authors can do that for themselves just by putting a document on a web server - five minutes' work for anyone at a university. So what does publishing a paper in a journal achieve? Why do it? What do people use a published paper for (besides reading it)? Can these functions be achieved by a different model of academic publishing, and if so, how might it work? Might it be more economically viable than the current capitalist model of journals selling in the marketplace? What different social institutions would be required?", tags: "Sociology", url: "http://www.tech.dmu.ac.uk/~mstacey/projects/functions-of-publishing.shtml", staff_id: 1, category_id: 1, level_id: 1, visible: true},
  {title: "Traffic Simulator ", description: "Brief Description\r\n\r\nHow do large numbers of actors with their own goals (which might be very simple) produce complex emergent behaviour? How can we study this? One area of research into complex systems that has important practical applications is how traffic behaves. (An important researcher in this area whom I know personally is Dr Jeff Johnson of the Department of Design and Innovation at the Open University.)\r\n\r\nThe objective of this project is to build a traffic simulator. The simulator should allow the user to create a network of roads that have distances (or travel times) between junctions, and a large set of travellers wishing to drive from one place to another. The speeds at which the travellers can drive, and how long it takes them to negotiate junctions, should depend on the density of traffic. Different classes of roads should have different functions relating traffic load to time (compare a motorway and an urban backstreet).\r\n\r\nThe system should record and report on the behaviour of the traffic. A graphic display is highly desirable, but instead you may prefer to compute statistics that describe the behaviour of the system and reveal interesting properties.\r\n\r\nExtensions\r\n\r\nThere are a variety of ways in which you could make the project more interesting and challenging. You can choose to concentrate on any one.\r\n\r\nUsing the system would be a great deal easier if the user could generate networks of roads and sets of travellers automatically. The user should ideally be able to vary the parameters used to generate the road network and the traveller sets. How realistic can you make the assumptions and parameters? (You should aim to keep it very simple and then add more sophistication incrementally.)\r\n\r\nThe simulations would be much more interesting and realistic if the travellers could vary their behaviour and learn what are the most effective routes. The simplest interesting learning behaviour is adjusting departure times to achieve a particular arrival time.\r\n\r\nHow can you display the road network and the traffic on it graphically, so that the user can understand what is really going on? You may want to focus the project on the information visualisation challenges it presents.\r\n\r\nWhat can you learn about complex systems by observing the system in action? You may want to relate your findings to other research on complex systems.", tags: "", url: "http://www.humanfactors.org", staff_id: 1, category_id: 1, level_id: 1, visible: false},
  {title: "Society website administration system", description: "Brief Description\r\n\r\nThe aim of this project is to develop a web-based system for running a society or a sports club or small charitable organization.\r\n\r\nThe system should enable the officers of the society to track members (maybe of different types) and whether they've paid their dues, and schedule and advertise events or other activities (maybe of different types, some of which might involve separate payments).\r\n\r\nThe system should enable the ordinary members of the society to check on upcoming events, the addresses and telephone numbers of other members, and possibly whether they themselves are up to date with their dues.\r\n\r\nThe system should enable ordinary members of the public, such as people who might be interested in the group and have found it via Google, to know what the group is about and what its activities are.\r\n\r\nThe system would need to take security very seriously. Ideally it would provide a way to handle payments to the society via Paypal.", tags: "Interactive system", url: "http://www.tech.dmu.ac.uk/~mstacey/projects/society-admin.shtml", staff_id: 1, category_id: 2, level_id: 1, visible: true},
  {title: "Interactive Support for Information Services", description: "Brief Description\r\n\r\nMany organisations performing a variety of functions (software vendors, government departments, universities) employ staff to help outsiders find information. These information providing staff may either provide information themselves, or reroute queries to other people with specialist knowledge. Increasingly, information requests arrive via email or the World Wide Web rather than by telephone.\r\n\r\nThe two traditional approaches to computer support for information retrieval are (1) databases that human operators can query, and (2) on-line search engines that end users can interact with directly without a human information provider. Is there a third alternative ? Can a computer support system work interactively with a human user to enhance the efficiency and effectiveness of information provision ? Your mission is to evaluate the needs and possibilities for interactive support systems for human information providers, and design ways to achieve those possibilities. The project deliverables should include (1) a scenario or set of scenarios for interactive information provision, (2) a requirements specification for an interactive support system for information provision, (3) a design for an interactive support system, (4) an evaluation of what needs your system would meet, and how well it would meet them. Your design and evaluation would be enhanced by the implementation of the user interface of your system in a screenpainting environment such as Visual Basic.\r\n\r\nExtension\r\n\r\nIf you want a more technical project, build an implementation of a prototype of your system.\r\n\r\n", tags: "", url: "http://www.tech.dmu.ac.uk/~mstacey/projects/inform.shtml", staff_id: 1, category_id: 3, level_id: 1, visible: true},
  {title: "The History Game: Game Building Tool", description: "Brief Description\r\n\r\nThe History Game (idea borrowed from Civilization™): You are a leader of a nomadic tribe at the dawn of history. Your mission is to guide your people to greatness, as your society grows, develops and meets other competing tribes in trade and war. You have to respond to famines, epidemics, climate changes, invasions and technological developments in your quest to achieve ultimate world domination….\r\n\r\nThe world's tribes develop and interact in different ways though time. A large part of the game is executing sets of rules for development over time, interactions between societies, and responding to random events. Programming and modifying these rules is a fascinating but complex and time-consuming job; it is an incremental task, first for building a first usable version of the game and then exploring variations.\r\n\r\nThe objective of the project is to develop a shell for the execution of rules governing the development of history according to the decisions of the players (human and machine) and the random geographical and social events they have to deal with, along with a user-friendly interactive game development tool for specifying the different sorts of rules that the shell needs to run. The design decisions involved in the project include considering what types of rules the History Game requires, working out what common structures they have, and designing effective ways to program each type of rule. The project should include a demonstration of the effectiveness of the game shell and the game building tool, but need not include a full-scale game implementation.", tags: "", url: "http://www.tech.dmu.ac.uk/~mstacey/projects/hgame-builder.shtml", staff_id: 2, category_id: 2, level_id: 1, visible: false},
  {title: "Helping Students Find Projects", description: "Brief Description\r\n\r\nIf they don't have brilliant ideas of their own, MSc students and final year undergraduates in the DMU School of Computing are invited to select a topic for a final year project from hundreds of proposals put forward by dozens of lecturers. This project is (at the time of writing) the thirty-sixth proposed by Martin Stacey. How on earth are you meant to find the one that best suits your skills, interests and ambitions?\r\n\r\nThe aim of this project is to develop a web-based system, to be included (if it works well enough) in the CPRJ 3051 web site, that helps students find project proposals that are likely to suit them. The system should enable lecturers to create very brief descriptions of their projects accompanied by keywords and ratings of how challenging they are along a number of dimensions, plus the URLs of full descriptions, and enter them in a database. It should enable students to search the database for projects that suit their requirements.\r\n\r\nVariants\r\n\r\nOne sensible way to store projects would be as XML documents using specially defined markup tags, that can then be used both for database lookups and displayed directly as web pages.\r\n\r\nAn alternative approach to the problem would be to connect the student-usable search engine to a web crawler that searches through the project proposal directories in the web spaces of all the School of Computing's lecturers (there is already a standard location for these, so it's feasible), and reads the project proposal web pages looking for keywords. The power of such a system would be greatly enhanced if it employed conventions for including challenge-ratings (etc) in the project descriptions (maybe this would be a good idea anyway).\r\n\r\nExtension\r\n\r\nIf you want to include an AI component in your project, you could add a module for assessing the suitability of projects for students (according to the search criteria and preferences they enter), and listing them in rank order. This could be made as complex as you like - such a mechanism could start simple, but there's infinite scope for adding sophistication.", tags: "", url: "http://www.tech.dmu.ac.uk/~mstacey/projects/project-finder.shtml", staff_id: 1, category_id: 2, level_id: 1, visible: true},
  {title: "Alien Diplomacy", description: "Brief Description\r\n\r\nDiplomacy is the best board game in the history of the planet, but it has one big limitation: it's set in Europe, in the same scenario every time. Of course, as Diplomacy is a political game, and people are always different, there's enough complexity in the scenario for dozens of games. However experienced players have a good understanding of what's an effective military strategy. So there are a lot of Diplomacy players out there who would welcome the chance to try their Diplomatic skills in the different geopolitical environments of alien planets.\r\n\r\nThe objective of this project is to develop a system that creates environments (essentially, continents) in which to play Diplomacy on alien planets. The game mechanism will be taken from Diplomacy, either completely or with appropriate modifications as determined by you. The system should be tailorable to fit the number of players who wish to participate in the game. The challenge of the project is in two parts.\r\n\r\nThe first challenge is the development of methods for generating a map of a continent comprising areas of land and sea and perhaps impassable regions, using algorithms incorporating random elements that produce geographically realistic results. The land areas on the map need to be divided into political regions, first into countries and then into districts, and some of these regions need to contain cities. These maps need to be displayed graphically.\r\n\r\nThe second challenge is the development of AI methods for choosing game maps that are likely to produce reasonably fair games, possibly including methods for guiding the division of the land area into political regions. This involves choosing maps that have countries and regions that are reasonably well balanced and which allow reasonably well balanced movement of units).\r\n\r\nExtensions\r\n\r\nThe system should generate maps that have the number of participant countries that the users ask for, so that the game scenario suits the number of players. (One trouble with Diplomacy in Europe is that the adaptations to numbers other than seven aren't ideal.)\r\n\r\nA useful extension would be the implementation of a feature for printing out the game map at a reasonable scale, or at a choice of scales. Ideally with a choice of black and white shading or colour.\r\n\r\nIt would be desirable to have an interface that allows users to play Alien Diplomacy on the computer, or possibly distributed over a number of different computers in different locations. This should ideally include mechanisms for checking the legality of moves and performing conflict resolution to determine the state of the game after each round. But this in itself is a big undertaking, that has been done separately as a student project by Denny De La Haye at DMU Milton Keynes. I've dropped that project proposal as Denny's work left no scope for other approaches.\r\n\r\nVariant\r\n\r\nIf you're a Risk player, rather than a Diplomacy player, create worlds in which to Risk all.", tags: "", url: "http://www.tech.dmu.ac.uk/~mstacey/projects/alien.shtml", staff_id: 2, category_id: 2, level_id: 2, visible: true},
  {title: "zsfhgjkjn", description: "rdtxyuyohi", tags: "", url: "", staff_id: 1, category_id: 3, level_id: 1, visible: true}
])



Feedback.create!([
  {body: "This system performs the functions that I expect it to. And I think it is good for now.\r\nThanks", student_id: 1}
])
Help.create!([
  {title: "How to Apply to Project", description: "To apply to for a project you must be logged into the system. when logged in, click on the project and you will see the full description of the project. below the description at the bottom right hand corner is the apply button. You can simply click apply and confirm and the application will be sent to the staff involved.\r\nhave a good experience"},
  {title: "Saving and viewing your shortlists", description: "To save a shortlist, you must n"}
])
ProjectApplication.create!([
  {student_id: 2, project_id: 3, staff_id: 1},
  {student_id: 1, project_id: 8, staff_id: 1}
])
ProjectSuggestion.create!([
  {title: "Reinforcement learning for robot..", description: "The description here", student_id: 1, staff_id: 3, note: nil}
])

Shortlist.create!([
  {student_id: 2, project_id: 3},
  {student_id: 2, project_id: 4}
])

Suggestionreply.create!([
  {note: "This is an interesting idea... lets discuss it... next Monday perhaps?", project_suggestion_id: 1, commenter: "Ben Passow"}
])
Allocation.create!([
  {student_id: 2, staff_id: 2, supervision_type_id: 1},
  {student_id: 1, staff_id: 1, supervision_type_id: 1},
  {student_id: 1, staff_id: 3, supervision_type_id: 1}
])

Course::HABTM_Projects.create!([
  {project_id: 2, course_id: 2},
  {project_id: 3, course_id: 2},
  {project_id: 4, course_id: 4},
  {project_id: 4, course_id: 2},
  {project_id: 5, course_id: 4},
  {project_id: 8, course_id: 4},
  {project_id: 8, course_id: 2},
  {project_id: 11, course_id: 13}
])
Project::HABTM_Courses.create!([
  {project_id: 2, course_id: 2},
  {project_id: 3, course_id: 2},
  {project_id: 4, course_id: 4},
  {project_id: 4, course_id: 2},
  {project_id: 5, course_id: 4},
  {project_id: 8, course_id: 4},
  {project_id: 8, course_id: 2},
  {project_id: 11, course_id: 13}
])
Project::HABTM_ProjectTags.create!([
  {project_id: 2, project_tag_id: 20},
  {project_id: 2, project_tag_id: 11},
  {project_id: 3, project_tag_id: 19},
  {project_id: 3, project_tag_id: 13},
  {project_id: 3, project_tag_id: 14},
  {project_id: 3, project_tag_id: 3},
  {project_id: 3, project_tag_id: 1},
  {project_id: 4, project_tag_id: 22},
  {project_id: 4, project_tag_id: 7},
  {project_id: 5, project_tag_id: 22},
  {project_id: 5, project_tag_id: 1},
  {project_id: 5, project_tag_id: 21},
  {project_id: 5, project_tag_id: 5},
  {project_id: 2, project_tag_id: 15},
  {project_id: 2, project_tag_id: 14},
  {project_id: 2, project_tag_id: 3},
  {project_id: 2, project_tag_id: 6},
  {project_id: 6, project_tag_id: 20},
  {project_id: 6, project_tag_id: 15},
  {project_id: 6, project_tag_id: 3},
  {project_id: 7, project_tag_id: 14},
  {project_id: 7, project_tag_id: 3},
  {project_id: 7, project_tag_id: 4},
  {project_id: 8, project_tag_id: 11},
  {project_id: 8, project_tag_id: 14},
  {project_id: 8, project_tag_id: 4},
  {project_id: 8, project_tag_id: 1},
  {project_id: 8, project_tag_id: 6},
  {project_id: 8, project_tag_id: 5},
  {project_id: 11, project_tag_id: 21}
])


ProjectTag::HABTM_Projects.create!([
  {project_id: 2, project_tag_id: 20},
  {project_id: 2, project_tag_id: 11},
  {project_id: 3, project_tag_id: 19},
  {project_id: 3, project_tag_id: 13},
  {project_id: 3, project_tag_id: 14},
  {project_id: 3, project_tag_id: 3},
  {project_id: 3, project_tag_id: 1},
  {project_id: 4, project_tag_id: 22},
  {project_id: 4, project_tag_id: 7},
  {project_id: 5, project_tag_id: 22},
  {project_id: 5, project_tag_id: 1},
  {project_id: 5, project_tag_id: 21},
  {project_id: 5, project_tag_id: 5},
  {project_id: 2, project_tag_id: 15},
  {project_id: 2, project_tag_id: 14},
  {project_id: 2, project_tag_id: 3},
  {project_id: 2, project_tag_id: 6},
  {project_id: 6, project_tag_id: 20},
  {project_id: 6, project_tag_id: 15},
  {project_id: 6, project_tag_id: 3},
  {project_id: 7, project_tag_id: 14},
  {project_id: 7, project_tag_id: 3},
  {project_id: 7, project_tag_id: 4},
  {project_id: 8, project_tag_id: 11},
  {project_id: 8, project_tag_id: 14},
  {project_id: 8, project_tag_id: 4},
  {project_id: 8, project_tag_id: 1},
  {project_id: 8, project_tag_id: 6},
  {project_id: 8, project_tag_id: 5},
  {project_id: 11, project_tag_id: 21}
])
ProjectTag::HABTM_Students.create!([
  {student_id: 1, project_tag_id: 1},
  {student_id: 2, project_tag_id: 22},
  {student_id: 2, project_tag_id: 16},
  {student_id: 2, project_tag_id: 10},
  {student_id: 3, project_tag_id: 11}
])

Student::HABTM_ProjectTags.create!([
  {student_id: 1, project_tag_id: 1},
  {student_id: 2, project_tag_id: 22},
  {student_id: 2, project_tag_id: 16},
  {student_id: 2, project_tag_id: 10},
  {student_id: 3, project_tag_id: 11}
])
