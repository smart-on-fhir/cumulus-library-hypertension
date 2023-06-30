create or replace view htn__define_rx_exclude as select * from (values
('http://www.nlm.nih.gov/research/umls/rxnorm', '1100184', 'Donepezil hydrochloride 23 MG Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1100187', 'Donepezil hydrochloride 23 MG Oral Tablet [Aricept]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1157970', 'rivastigmine Oral Liquid Product')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1157971', 'rivastigmine Oral Product')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1157972', 'rivastigmine Pill')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1157973', 'rivastigmine Topical Product')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1160637', 'donepezil Oral Liquid Product')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1160638', 'donepezil Oral Product')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1160639', 'donepezil Pill')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1163353', 'Galantamine Oral Liquid Product')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1163354', 'Galantamine Oral Product')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1163355', 'Galantamine Pill')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1295290', 'donepezil Disintegrating Oral Product')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1295358', 'rivastigmine Transdermal Product')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1308568', 'rivastigmine 0.554 MG/HR')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1308569', '24 HR rivastigmine 0.554 MG/HR Transdermal System')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1308570', 'rivastigmine 0.554 MG/HR [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1308571', '24 HR rivastigmine 0.554 MG/HR Transdermal System [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '135447', 'donepezil')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1430990', 'donepezil / Memantine')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1599800', 'donepezil / Memantine Oral Product')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1599801', 'donepezil / Memantine Pill')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1599802', 'donepezil / Memantine Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1599803', '24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 28 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1599805', '24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 14 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1602584', 'Donepezil hydrochloride 10 MG / Memantine hydrochloride 14 MG [Namzaric]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1602585', 'donepezil / Memantine Extended Release Oral Capsule [Namzaric]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1602588', '24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 14 MG Extended Release Oral Capsule [Namzaric]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1602593', 'Donepezil hydrochloride 10 MG / Memantine hydrochloride 28 MG [Namzaric]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1602594', '24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 28 MG Extended Release Oral Capsule [Namzaric]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1805420', '24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 21 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1805421', 'Donepezil hydrochloride 10 MG / Memantine hydrochloride 21 MG [Namzaric]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1805422', '24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 21 MG Extended Release Oral Capsule [Namzaric]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1805425', '24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 7 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1805426', 'Donepezil hydrochloride 10 MG / Memantine hydrochloride 7 MG [Namzaric]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1805427', '24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 7 MG Extended Release Oral Capsule [Namzaric]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1805978', 'rivastigmine Transdermal System')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1805980', 'rivastigmine Transdermal System [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '183379', 'rivastigmine')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1858970', '{7 (24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 14 MG Extended Release Oral Capsule) / 7 (24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 21 MG Extended Release Oral Capsule) / 7 (24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 28 MG Extended Release Oral Capsule) / 7 (24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 7 MG Extended Release Oral Capsule) } Pack')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1858971', '{7 (24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 14 MG Extended Release Oral Capsule [Namzaric]) / 7 (24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 21 MG Extended Release Oral Capsule [Namzaric]) / 7 (24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 28 MG Extended Release Oral Capsule [Namzaric]) / 7 (24 HR Donepezil hydrochloride 10 MG / Memantine hydrochloride 7 MG Extended Release Oral Capsule [Namzaric]) } Pack [Namzaric Titration Pack]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '226665', 'rivastigmine 1.5 MG Oral Capsule [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '226666', 'rivastigmine 3 MG Oral Capsule [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '226667', 'rivastigmine 4.5 MG Oral Capsule [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '226668', 'rivastigmine 6 MG Oral Capsule [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '236559', 'Donepezil hydrochloride')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '310436', 'Galantamine 4 MG Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '310437', 'Galantamine 8 MG Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '312834', 'rivastigmine 2 MG/ML Oral Solution')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '312835', 'rivastigmine 3 MG Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '312836', 'rivastigmine 6 MG Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '314214', 'rivastigmine 1.5 MG Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '314215', 'rivastigmine 4.5 MG Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '330343', 'Galantamine 12 MG')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '330344', 'Galantamine 4 MG')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '330345', 'Galantamine 8 MG')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '331507', 'rivastigmine 2 MG/ML')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '331508', 'rivastigmine 1.5 MG')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '331509', 'rivastigmine 3 MG')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '331510', 'rivastigmine 4.5 MG')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '331511', 'rivastigmine 6 MG')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '366553', 'rivastigmine Oral Capsule [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '367663', 'donepezil Oral Tablet [Aricept]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '371957', 'donepezil Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '373797', 'rivastigmine Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '374628', 'rivastigmine Oral Solution')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '384641', 'Galantamine Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '384642', 'Galantamine Oral Solution')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '4637', 'Galantamine')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '483068', 'donepezil Disintegrating Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '483071', 'donepezil Oral Solution')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '491128', 'donepezil Disintegrating Oral Tablet [Aricept]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '574012', 'rivastigmine 1.5 MG [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '574013', 'rivastigmine 3 MG [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '574014', 'rivastigmine 4.5 MG [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '574015', 'rivastigmine 6 MG [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '579148', 'Galantamine 12 MG Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '583097', 'Galantamine Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '583101', 'Galantamine Extended Release Oral Capsule [Razadyne]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '583133', 'Galantamine 8 MG [Razadyne]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '602732', 'Galantamine 12 MG [Razadyne]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '602733', 'Galantamine Oral Tablet [Razadyne]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '602734', 'Galantamine 12 MG Oral Tablet [Razadyne]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '602735', 'Galantamine 4 MG [Razadyne]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '602736', 'Galantamine 4 MG Oral Tablet [Razadyne]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '602737', 'Galantamine 8 MG Oral Tablet [Razadyne]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '702120', 'donepezil Oral Solution [Aricept]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '725019', 'rivastigmine 0.192 MG/HR')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '725021', '24 HR rivastigmine 0.192 MG/HR Transdermal System')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '725022', 'rivastigmine 0.396 MG/HR')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '725023', '24 HR rivastigmine 0.396 MG/HR Transdermal System')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '725104', 'rivastigmine 0.396 MG/HR [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '725105', '24 HR rivastigmine 0.396 MG/HR Transdermal System [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '751301', 'rivastigmine 0.192 MG/HR [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '751302', '24 HR rivastigmine 0.192 MG/HR Transdermal System [Exelon]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860693', 'galantamine hydrobromide')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860694', 'galantamine hydrobromide 16 MG')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860695', '24 HR galantamine hydrobromide 16 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860696', 'galantamine hydrobromide 16 MG [Razadyne]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860697', '24 HR galantamine hydrobromide 16 MG Extended Release Oral Capsule [Razadyne]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860706', 'galantamine hydrobromide 24 MG')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860707', '24 HR galantamine hydrobromide 24 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860708', 'galantamine hydrobromide 24 MG [Razadyne]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860709', '24 HR galantamine hydrobromide 24 MG Extended Release Oral Capsule [Razadyne]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860714', 'galantamine hydrobromide 8 MG')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860715', '24 HR galantamine hydrobromide 8 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860716', 'galantamine hydrobromide 8 MG [Razadyne]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860717', '24 HR galantamine hydrobromide 8 MG Extended Release Oral Capsule [Razadyne]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860900', 'galantamine hydrobromide 4 MG/ML')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860901', 'galantamine hydrobromide 4 MG/ML Oral Solution')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '994808', 'Rivastigmine tartrate')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997215', 'Donepezil hydrochloride 1 MG/ML')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997216', 'Donepezil hydrochloride 1 MG/ML Oral Solution')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997217', 'Donepezil hydrochloride 1 MG/ML [Aricept]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997218', 'Donepezil hydrochloride 1 MG/ML Oral Solution [Aricept]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997219', 'Donepezil hydrochloride 10 MG')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997220', 'Donepezil hydrochloride 10 MG Disintegrating Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997221', 'Donepezil hydrochloride 10 MG [Aricept]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997222', 'Donepezil hydrochloride 10 MG Disintegrating Oral Tablet [Aricept]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997223', 'Donepezil hydrochloride 10 MG Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997224', 'Donepezil hydrochloride 10 MG Oral Tablet [Aricept]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997225', 'Donepezil hydrochloride 5 MG')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997226', 'Donepezil hydrochloride 5 MG Disintegrating Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997227', 'Donepezil hydrochloride 5 MG [Aricept]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997228', 'Donepezil hydrochloride 5 MG Disintegrating Oral Tablet [Aricept]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997229', 'Donepezil hydrochloride 5 MG Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997230', 'Donepezil hydrochloride 5 MG Oral Tablet [Aricept]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '998579', 'Donepezil hydrochloride 23 MG')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '998582', 'Donepezil hydrochloride 23 MG [Aricept]')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1100184', 'donepezil hydrochloride 23 MG Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1308569', '24 HR rivastigmine 0.554 MG/HR Transdermal System')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1599803', '24 HR donepezil hydrochloride 10 MG / memantine hydrochloride 28 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1599805', '24 HR donepezil hydrochloride 10 MG / memantine hydrochloride 14 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1805420', '24 HR donepezil hydrochloride 10 MG / memantine hydrochloride 21 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1805425', '24 HR donepezil hydrochloride 10 MG / memantine hydrochloride 7 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '1858970', '{7 (24 HR donepezil hydrochloride 10 MG / memantine hydrochloride 14 MG Extended Release Oral Capsule) / 7 (24 HR donepezil hydrochloride 10 MG / memantine hydrochloride 21 MG Extended Release Oral Capsule) / 7 (24 HR donepezil hydrochloride 10 MG / memantine hydrochloride 28 MG Extended Release Oral Capsule) / 7 (24 HR donepezil hydrochloride 10 MG / memantine hydrochloride 7 MG Extended Release Oral Capsule) } Pack')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '310436', 'galantamine 4 MG Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '310437', 'galantamine 8 MG Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '312835', 'rivastigmine 3 MG Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '312836', 'rivastigmine 6 MG Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '314214', 'rivastigmine 1.5 MG Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '314215', 'rivastigmine 4.5 MG Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '579148', 'galantamine 12 MG Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '725021', '24 HR rivastigmine 0.192 MG/HR Transdermal System')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '725023', '24 HR rivastigmine 0.396 MG/HR Transdermal System')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860695', '24 HR galantamine hydrobromide 16 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860707', '24 HR galantamine hydrobromide 24 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860715', '24 HR galantamine hydrobromide 8 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '860901', 'galantamine hydrobromide 4 MG/ML Oral Solution')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '996561', 'memantine hydrochloride 10 MG Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '996571', 'memantine hydrochloride 5 MG Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '996572', '{21 (memantine hydrochloride 10 MG Oral Tablet) / 28 (memantine hydrochloride 5 MG Oral Tablet) } Pack')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '996594', '24 HR memantine hydrochloride 14 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '996603', '24 HR memantine hydrochloride 21 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '996609', '24 HR memantine hydrochloride 28 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '996615', '24 HR memantine hydrochloride 7 MG Extended Release Oral Capsule')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '996624', '{7 (24 HR memantine hydrochloride 14 MG Extended Release Oral Capsule) / 7 (24 HR memantine hydrochloride 21 MG Extended Release Oral Capsule) / 7 (24 HR memantine hydrochloride 28 MG Extended Release Oral Capsule) / 7 (24 HR memantine hydrochloride 7 MG Extended Release Oral Capsule) } Pack')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '996740', 'memantine hydrochloride 2 MG/ML Oral Solution')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997220', 'donepezil hydrochloride 10 MG Disintegrating Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997223', 'donepezil hydrochloride 10 MG Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997226', 'donepezil hydrochloride 5 MG Disintegrating Oral Tablet')
,('http://www.nlm.nih.gov/research/umls/rxnorm', '997229', 'donepezil hydrochloride 5 MG Oral Tablet')
) AS t (system, code, display) ;