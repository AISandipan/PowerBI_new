CREATE DATABASE telecom_cyber_projects;

USE telecom_cyber_projects;
CREATE TABLE Projects (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100) NOT NULL,
    Project_Type VARCHAR(100),
    Business_Unit VARCHAR(100),
    Project_Manager VARCHAR(100),
    Start_Date DATE,
    End_Date DATE,
    Budget_USD DECIMAL(12,2),
    Actual_Cost_USD DECIMAL(12,2),
    Overall_Status VARCHAR(20)
);
CREATE TABLE Milestones (
    Milestone_ID INT PRIMARY KEY,
    Project_ID INT,
    Milestone_Name VARCHAR(150),
    Start_Date DATE,
    End_Date DATE,
    Planned_Percent DECIMAL(5,2),
    Actual_Percent DECIMAL(5,2),
    Status VARCHAR(20),
    FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID)
);
CREATE TABLE Tasks (
    Task_ID INT PRIMARY KEY,
    Milestone_ID INT,
    Project_ID INT,
    Task_Name VARCHAR(200),
    Start_Date DATE,
    End_Date DATE,
    Planned_Percent DECIMAL(5,2),
    Actual_Percent DECIMAL(5,2),
    Status VARCHAR(20),
    Resources VARCHAR(200),
    FOREIGN KEY (Milestone_ID) REFERENCES Milestones(Milestone_ID),
    FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID)
);
CREATE TABLE Risks_Issues (
    Risk_ID INT PRIMARY KEY,
    Project_ID INT,
    Risk_Category VARCHAR(100),
    Risk_Description VARCHAR(300),
    Probability VARCHAR(20),
    Impact VARCHAR(20),
    Risk_Score INT,
    Mitigation_Action VARCHAR(300),
    Owner VARCHAR(100),
    Status VARCHAR(30),
    FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID)
);

CREATE TABLE Resources (
    Resource_ID INT PRIMARY KEY,
    Project_ID INT,
    Resource_Name VARCHAR(100),
    Role VARCHAR(100),
    Allocation_Percent DECIMAL(5,2),
    Cost_USD DECIMAL(12,2),
    FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID)
);
INSERT INTO Projects
(Project_ID, Project_Name, Project_Type, Business_Unit, Project_Manager,
 Start_Date, End_Date, Budget_USD, Actual_Cost_USD, Overall_Status)
VALUES

(101, 'NextGen Firewall Upgrade', 'Firewall Upgrade',
 'Network Security', 'Ahmed Khan',
 '2026-01-05', '2026-05-30', 250000, 265000, 'Delay'),

(102, 'SOC Implementation', 'SOC Implementation',
 'Cyber Security', 'Sara Ahmed',
 '2026-01-15', '2026-08-31', 600000, 570000, 'Risk'),

(103, 'ISO 27001 Compliance Audit', 'Compliance',
 'Governance Risk Compliance', 'John Mathew',
 '2026-02-01', '2026-06-30', 180000, 165000, 'On Track'),

(104, 'DDoS Protection Enhancement', 'Network Security',
 'Network Operations', 'Fatima Ali',
 '2026-02-15', '2026-07-31', 320000, 350000, 'Delay'),

(105, 'Identity & Access Management Upgrade', 'IAM',
 'IT Security', 'Omar Hassan',
 '2026-03-01', '2026-09-30', 280000, 260000, 'On Track'),

(106, 'SIEM Migration Project', 'SIEM',
 'SOC Operations', 'Michael George',
 '2026-03-15', '2026-10-31', 450000, 430000, 'Risk'),

(107, 'Cloud Security Assessment', 'Cloud Security',
 'Cloud Infrastructure', 'Nadia Karim',
 '2026-04-01', '2026-08-15', 150000, 175000, 'Delay'),

(108, 'Vulnerability Management Upgrade', 'Vulnerability Management',
 'Cyber Security', 'Daniel Thomas',
 '2026-04-15', '2026-09-15', 210000, 200000, 'On Track'),

(109, 'Privileged Access Management', 'PAM',
 'IT Security', 'Aisha Rahman',
 '2026-05-01', '2026-11-30', 300000, 290000, 'Risk'),

(110, 'Security Awareness Programme', 'Security Awareness',
 'Human Risk Management', 'Robert James',
 '2026-05-15', '2026-08-31', 90000, 85000, 'On Track');
 
 #---Milestone..
INSERT INTO Milestones
(Milestone_ID, Project_ID, Milestone_Name,
 Start_Date, End_Date, Planned_Percent, Actual_Percent, Status)
VALUES

(1001,101,'Firewall Design','2026-01-05','2026-01-31',100,100,'On Track'),
(1002,101,'Hardware Deployment','2026-02-01','2026-03-15',100,85,'Delay'),
(1003,101,'Configuration & Testing','2026-03-16','2026-04-30',100,65,'Delay'),
(1004,101,'Production Migration','2026-05-01','2026-05-30',100,40,'Risk'),

(2001,102,'SOC Architecture','2026-01-15','2026-02-28',100,100,'On Track'),
(2002,102,'Tool Deployment','2026-03-01','2026-04-30',100,90,'On Track'),
(2003,102,'SIEM Integration','2026-05-01','2026-06-30',100,70,'Risk'),
(2004,102,'SOC Go-Live','2026-07-01','2026-08-31',100,45,'Risk'),

(3001,103,'Gap Assessment','2026-02-01','2026-03-15',100,100,'On Track'),
(3002,103,'Remediation','2026-03-16','2026-05-15',100,95,'On Track'),
(3003,103,'Internal Audit','2026-05-16','2026-06-10',100,90,'On Track'),
(3004,103,'Certification Audit','2026-06-11','2026-06-30',100,80,'On Track'),

(4001,104,'DDoS Architecture','2026-02-15','2026-03-31',100,100,'On Track'),
(4002,104,'Vendor Deployment','2026-04-01','2026-05-31',100,75,'Delay'),
(4003,104,'Traffic Testing','2026-06-01','2026-06-30',100,55,'Delay'),
(4004,104,'Production Rollout','2026-07-01','2026-07-31',100,30,'Delay'),

(5001,105,'IAM Assessment','2026-03-01','2026-04-15',100,100,'On Track'),
(5002,105,'Solution Design','2026-04-16','2026-05-31',100,95,'On Track'),
(5003,105,'Implementation','2026-06-01','2026-08-15',100,85,'On Track'),
(5004,105,'User Migration','2026-08-16','2026-09-30',100,50,'Risk'),

(6001,106,'SIEM Platform Setup','2026-03-15','2026-04-30',100,100,'On Track'),
(6002,106,'Data Source Integration','2026-05-01','2026-07-15',100,80,'Risk'),
(6003,106,'Use Case Development','2026-07-16','2026-09-15',100,55,'Risk'),
(6004,106,'Production Cutover','2026-09-16','2026-10-31',100,20,'Risk'),

(7001,107,'Cloud Discovery','2026-04-01','2026-04-30',100,100,'On Track'),
(7002,107,'Security Assessment','2026-05-01','2026-06-15',100,70,'Delay'),
(7003,107,'Remediation','2026-06-16','2026-07-31',100,45,'Delay'),
(7004,107,'Final Report','2026-08-01','2026-08-15',100,25,'Delay'),

(8001,108,'Asset Discovery','2026-04-15','2026-05-31',100,100,'On Track'),
(8002,108,'Scanning Configuration','2026-06-01','2026-06-30',100,95,'On Track'),
(8003,108,'Vulnerability Scanning','2026-07-01','2026-08-15',100,90,'On Track'),
(8004,108,'Remediation Tracking','2026-08-16','2026-09-15',100,60,'On Track'),

(9001,109,'PAM Assessment','2026-05-01','2026-06-15',100,100,'On Track'),
(9002,109,'PAM Architecture','2026-06-16','2026-07-31',100,90,'On Track'),
(9003,109,'Implementation','2026-08-01','2026-10-15',100,55,'Risk'),
(9004,109,'Privileged Account Migration','2026-10-16','2026-11-30',100,20,'Risk'),

(10001,110,'Training Content','2026-05-15','2026-06-15',100,100,'On Track'),
(10002,110,'Employee Training','2026-06-16','2026-07-31',100,95,'On Track'),
(10003,110,'Assessment','2026-08-01','2026-08-20',100,90,'On Track'),
(10004,110,'Closure Report','2026-08-21','2026-08-31',100,85,'On Track');

#-----task level..
INSERT INTO Tasks
(Task_ID, Milestone_ID, Project_ID, Task_Name,
 Start_Date, End_Date, Planned_Percent, Actual_Percent,
 Status, Resources)
VALUES

(1,1001,101,'Firewall Requirement Gathering','2026-01-05','2026-01-15',100,100,'On Track','Network Architect'),
(2,1001,101,'Firewall Design Approval','2026-01-16','2026-01-31',100,100,'On Track','Security Architect'),

(3,1002,101,'Firewall Hardware Delivery','2026-02-01','2026-02-20',100,80,'Delay','Vendor Team'),
(4,1002,101,'Rack & Network Installation','2026-02-21','2026-03-15',100,90,'On Track','Network Engineering'),

(5,1003,101,'Firewall Configuration','2026-03-16','2026-04-10',100,70,'Delay','Security Engineers'),
(6,1003,101,'Security Rule Testing','2026-04-11','2026-04-30',100,60,'Delay','SOC Team'),

(7,1004,101,'Production Migration Planning','2026-05-01','2026-05-15',100,45,'Risk','Network Operations'),
(8,1004,101,'Final Migration','2026-05-16','2026-05-30',100,35,'Risk','Network Operations'),

(9,2001,102,'SOC Architecture Design','2026-01-15','2026-02-15',100,100,'On Track','SOC Architect'),
(10,2001,102,'Architecture Approval','2026-02-16','2026-02-28',100,100,'On Track','CISO Team'),

(11,2002,102,'SOC Tool Installation','2026-03-01','2026-03-31',100,90,'On Track','SOC Engineers'),
(12,2002,102,'Monitoring Configuration','2026-04-01','2026-04-30',100,90,'On Track','SOC Engineers'),

(13,2003,102,'SIEM Integration','2026-05-01','2026-06-15',100,70,'Risk','SIEM Team'),
(14,2003,102,'Log Source Onboarding','2026-06-16','2026-06-30',100,65,'Risk','SOC Engineers'),

(15,2004,102,'SOC UAT','2026-07-01','2026-07-31',100,50,'Risk','SOC Team'),
(16,2004,102,'SOC Go-Live','2026-08-01','2026-08-31',100,40,'Risk','SOC Team'),

(17,3001,103,'Compliance Gap Analysis','2026-02-01','2026-02-28',100,100,'On Track','GRC Team'),
(18,3001,103,'Gap Assessment Report','2026-03-01','2026-03-15',100,100,'On Track','GRC Team'),

(19,3002,103,'Control Remediation','2026-03-16','2026-04-30',100,95,'On Track','IT Security'),
(20,3002,103,'Evidence Collection','2026-05-01','2026-05-15',100,95,'On Track','GRC Team'),

(21,4002,104,'DDoS Vendor Deployment','2026-04-01','2026-05-15',100,75,'Delay','Vendor Team'),
(22,4002,104,'Configuration Validation','2026-05-16','2026-05-31',100,70,'Delay','Network Security'),

(23,4003,104,'Traffic Simulation','2026-06-01','2026-06-20',100,55,'Delay','Network Team'),
(24,4003,104,'Performance Testing','2026-06-21','2026-06-30',100,50,'Delay','Network Team'),

(25,5003,105,'IAM Platform Deployment','2026-06-01','2026-07-15',100,90,'On Track','IAM Team'),
(26,5003,105,'Application Integration','2026-07-16','2026-08-15',100,80,'On Track','IAM Team'),

(27,6002,106,'SIEM Data Source Mapping','2026-05-01','2026-06-15',100,80,'Risk','SIEM Team'),
(28,6002,106,'Log Integration','2026-06-16','2026-07-15',100,75,'Risk','SOC Engineers'),

(29,7002,107,'Cloud Security Assessment','2026-05-01','2026-06-15',100,70,'Delay','Cloud Security Team'),
(30,7003,107,'Remediation Activities','2026-06-16','2026-07-31',100,45,'Delay','Cloud Engineering'),

(31,8003,108,'Vulnerability Scanning','2026-07-01','2026-08-15',100,90,'On Track','Security Analysts'),
(32,8004,108,'Remediation Tracking','2026-08-16','2026-09-15',100,60,'On Track','Security Analysts'),

(33,9003,109,'PAM Implementation','2026-08-01','2026-09-15',100,60,'Risk','IAM Team'),
(34,9003,109,'Application Onboarding','2026-09-16','2026-10-15',100,50,'Risk','Application Team'),

(35,10002,110,'Employee Training','2026-06-16','2026-07-31',100,95,'On Track','HR & Security'),
(36,10003,110,'Security Assessment','2026-08-01','2026-08-20',100,90,'On Track','Security Awareness Team');

#Risks_Issues...

INSERT INTO Risks_Issues
(Risk_ID, Project_ID, Risk_Category, Risk_Description,
 Probability, Impact, Risk_Score, Mitigation_Action, Owner, Status)
VALUES

(1,101,'Vendor','Firewall hardware delivery delayed',
 'High','High',9,
 'Escalate vendor and maintain backup hardware supplier',
 'Procurement Manager','Open'),

(2,101,'Technical','Firewall configuration complexity',
 'Medium','High',6,
 'Assign additional security engineers and conduct design review',
 'Security Architect','Open'),

(3,102,'Integration','Multiple log sources not integrated with SIEM',
 'High','High',9,
 'Prioritize critical log sources and add integration resources',
 'SOC Manager','Open'),

(4,102,'Resource','Shortage of experienced SOC engineers',
 'High','High',9,
 'Use external SOC specialists and cross-train internal team',
 'CISO','Open'),

(5,103,'Compliance','Delayed evidence from business teams',
 'Medium','Medium',4,
 'Introduce evidence submission deadlines and escalation process',
 'GRC Manager','Monitoring'),

(6,104,'Vendor','DDoS vendor deployment delays',
 'High','High',9,
 'Weekly vendor governance meeting and escalation',
 'Vendor Manager','Open'),

(7,104,'Technical','Traffic testing environment unavailable',
 'Medium','High',6,
 'Reserve test environment in advance',
 'Network Manager','Open'),

(8,105,'Resource','Limited IAM implementation resources',
 'Medium','Medium',4,
 'Reallocate IAM resources during migration phase',
 'IT Manager','Monitoring'),

(9,106,'Integration','Legacy systems incompatible with SIEM',
 'High','High',9,
 'Develop custom connectors for critical legacy systems',
 'SIEM Manager','Open'),

(10,106,'Technical','High volume of security logs',
 'Medium','High',6,
 'Optimize SIEM ingestion and storage architecture',
 'SOC Architect','Open'),

(11,107,'Technical','Cloud configuration vulnerabilities',
 'High','High',9,
 'Prioritize critical vulnerabilities and enforce remediation SLA',
 'Cloud Security Lead','Open'),

(12,107,'Resource','Limited cloud security specialists',
 'Medium','High',6,
 'Bring external cloud security consultant',
 'Cloud Manager','Open'),

(13,109,'Integration','PAM integration with legacy applications',
 'High','High',9,
 'Conduct application compatibility assessment',
 'IAM Manager','Open'),

(14,109,'Resource','Business users slow to approve privileged accounts',
 'Medium','Medium',4,
 'Introduce automated approval workflow',
 'Business Owner','Monitoring'),

(15,110,'Adoption','Low employee participation',
 'Low','Medium',2,
 'Send reminders and management escalation',
 'HR Manager','Closed');
 
#Resource Data..

INSERT INTO Resources
(Resource_ID, Project_ID, Resource_Name, Role,
 Allocation_Percent, Cost_USD)
VALUES

(1,101,'Ahmed Khan','Security Architect',80,45000),
(2,101,'Network Engineering Team','Network Engineer',100,60000),
(3,101,'Vendor Team','Vendor Engineer',60,35000),

(4,102,'Sara Ahmed','SOC Manager',100,70000),
(5,102,'SOC Engineering Team','SOC Engineer',100,120000),
(6,102,'SIEM Team','SIEM Engineer',80,90000),

(7,103,'John Mathew','GRC Manager',80,45000),
(8,103,'Audit Team','Compliance Analyst',100,55000),

(9,104,'Fatima Ali','Network Security Manager',80,50000),
(10,104,'DDoS Vendor Team','Security Engineer',100,80000),

(11,105,'Omar Hassan','IAM Manager',80,55000),
(12,105,'IAM Engineering Team','IAM Engineer',100,95000),

(13,106,'Michael George','SIEM Manager',80,60000),
(14,106,'SIEM Engineering Team','SIEM Engineer',100,100000),

(15,107,'Nadia Karim','Cloud Security Lead',100,65000),
(16,107,'Cloud Engineering Team','Cloud Engineer',80,70000),

(17,108,'Daniel Thomas','Security Analyst',100,55000),
(18,108,'Vulnerability Team','Security Analyst',80,50000),

(19,109,'Aisha Rahman','PAM Manager',80,55000),
(20,109,'IAM Team','IAM Engineer',100,90000),

(21,110,'Robert James','Security Awareness Lead',60,35000),
(22,110,'HR Team','Training Specialist',50,25000);

SELECT * FROM Projects;
SELECT * FROM Milestones;
SELECT * FROM Tasks;
SELECT * FROM Risks_Issues;
SELECT * FROM Resources;


#A. Delayed projects
SELECT
    Project_ID,
    Project_Name,
    Project_Type,
    Start_Date,
    End_Date,
    Budget_USD,
    Actual_Cost_USD,
    Overall_Status
FROM Projects
WHERE Overall_Status = 'Delay';

#Plan vs Actual performance..Gap Analysis..
#The important concept here is:
#Performance Gap = Actual % − Planned %
#Negative = behind plan.
#Positive = ahead of plan.

SELECT
    p.Project_ID,
    p.Project_Name,
    ROUND(AVG(m.Planned_Percent),2) AS Planned_Percent,
    ROUND(AVG(m.Actual_Percent),2) AS Actual_Percent,
    ROUND(AVG(m.Actual_Percent) - AVG(m.Planned_Percent),2) AS Performance_Gap
FROM Projects p
JOIN Milestones m
    ON p.Project_ID = m.Project_ID
GROUP BY
    p.Project_ID,
    p.Project_Name
ORDER BY Performance_Gap ASC;
#high-risk areas..
#Vendor_dependency and technical/integration complexity are major risk themes across the cybersecurity portfolio..
SELECT
    Risk_Category,
    COUNT(*) AS Number_of_Risks,
    SUM(CASE WHEN Risk_Score >= 9 THEN 1 ELSE 0 END) AS High_Risks,
    AVG(Risk_Score) AS Average_Risk_Score
FROM Risks_Issues
GROUP BY Risk_Category
ORDER BY Average_Risk_Score DESC;
#Top 3 Risks....
SELECT
    r.Risk_ID,
    p.Project_Name,
    r.Risk_Category,
    r.Risk_Description,
    r.Probability,
    r.Impact,
    r.Risk_Score,
    r.Mitigation_Action,
    r.Owner
FROM Risks_Issues r
JOIN Projects p
    ON r.Project_ID = p.Project_ID
ORDER BY r.Risk_Score DESC
LIMIT 3;
#Financial Analysis..calculate variance..
SELECT
    Project_ID,
    Project_Name,
    Budget_USD,
    Actual_Cost_USD,
    Actual_Cost_USD - Budget_USD AS Cost_Variance,
    ROUND(
        ((Actual_Cost_USD - Budget_USD) / Budget_USD) * 100,
        2
    ) AS Cost_Variance_Percent
FROM Projects
ORDER BY Cost_Variance DESC;

#Power BI-friendly view..

CREATE VIEW Project_Performance AS
SELECT
    p.Project_ID,
    p.Project_Name,
    p.Project_Type,
    p.Business_Unit,
    p.Project_Manager,
    p.Start_Date,
    p.End_Date,
    p.Budget_USD,
    p.Actual_Cost_USD,
    p.Overall_Status,
    ROUND(AVG(m.Planned_Percent),2) AS Planned_Percent,
    ROUND(AVG(m.Actual_Percent),2) AS Actual_Percent,
    ROUND(
        AVG(m.Actual_Percent) - AVG(m.Planned_Percent),
        2
    ) AS Performance_Gap
FROM Projects p
LEFT JOIN Milestones m
    ON p.Project_ID = m.Project_ID
GROUP BY
    p.Project_ID,
    p.Project_Name,
    p.Project_Type,
    p.Business_Unit,
    p.Project_Manager,
    p.Start_Date,
    p.End_Date,
    p.Budget_USD,
    p.Actual_Cost_USD,
    p.Overall_Status;

SELECT * FROM Project_Performance;





















