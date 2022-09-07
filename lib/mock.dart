import 'models/applicant.dart';
import 'models/contest.dart';

List<String> group1 = [
  "John Green",
  "Apple Seed",
  "Berkowitz Falafel",
  "Camilla Yoon",
  "John Adams"
];

List<String> group2 = [
  "Peanut Butter",
  "Apple Sauce",
  "Burnt Falafel",
  "Clam Chowder",
  "Apple Jam"
];

Contest mockContest = Contest(
  categories: [
    "Personality",
    "Academic Potential",
    "Technical Ability",
    "Achievements"
  ],
  title: 'Fellows 2022',
  groups: ['Day 1: Saturday', 'Day 2: Sunday'],
  judges: ["caroline.yoon@me.com", "stimyoon@emory.edu"],
  applicants: [
    for (int i = 0; i < 10; i++)
      Applicant(id: i.toString(), groupID: 0, name: group1[i % group1.length]),
    for (int i = 0; i < 10; i++)
      Applicant(
          id: (i + 10).toString(), groupID: 1, name: group2[i % group2.length])
  ],
);

Contest mockContest1 = Contest(
  categories: [
    "Personality",
    "Academic Potential",
    "Technical Ability",
    "Achievements"
  ],
  title: 'Fellows 2023',
  groups: ['Day 1: Saturday', 'Day 2: Sunday'],
  judges: ["caroline.yoon@me.com", "stimyoon@emory.edu"],
  applicants: [
    for (int i = 0; i < 5; i++)
      Applicant(
        id: i.toString(),
        groupID: 0,
        name: group1[i % group1.length],
      ),
    for (int i = 0; i < 5; i++)
      Applicant(
        id: (i + 5).toString(),
        groupID: 1,
        name: group2[i % group2.length],
      ),
  ],
);

List<Contest> contests = [mockContest, mockContest1];
