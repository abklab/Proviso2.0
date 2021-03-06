USE [PROVISIODB]
GO
/****** Object:  Table [dbo].[Loan_Outstanding_3]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loan_Outstanding_3](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[Account_Number] [varchar](50) NOT NULL,
	[Account_Name] [varchar](50) NOT NULL,
	[Balance] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Loan_Outstanding_3] PRIMARY KEY CLUSTERED 
(
	[Account_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwCustomersLoanOutstanding]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCustomersLoanOutstanding]
AS
SELECT        EntryID, Account_Number, Account_Name, Balance
FROM            dbo.Loan_Outstanding_3
GO
/****** Object:  Table [dbo].[Bank_Loan_Repayment]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank_Loan_Repayment](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[RefNo] [varchar](50) NOT NULL,
	[B_AccountNumber] [varchar](50) NULL,
	[MNO] [varchar](50) NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[LastUpdated] [datetime] NULL,
	[TransactionID] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientSecurity]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientSecurity](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [date] NOT NULL,
	[ClientApiKey] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ApiClientName] [varchar](100) NOT NULL,
	[ExpirationDate] [date] NULL,
 CONSTRAINT [PK_APIUserKeys] PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanApplication]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanApplication](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](100) NOT NULL,
	[RequestAmount] [decimal](18, 0) NOT NULL,
	[SectorID] [varchar](50) NULL,
	[ContactNumber] [varchar](50) NOT NULL,
	[Location] [varchar](50) NULL,
	[NearestLandmark] [varchar](150) NULL,
	[DistributionMode] [varchar](50) NULL,
	[MNO] [varchar](50) NULL,
	[MomoNumber] [varchar](50) NULL,
	[BankAccountNumber] [varchar](50) NULL,
	[RequestDate] [date] NULL,
	[Comments] [varchar](250) NULL,
 CONSTRAINT [PK_LoanApplication] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Momo_Loan_Repayment]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Momo_Loan_Repayment](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
	[TransactionID] [varchar](50) NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[MomoNumber] [varchar](50) NULL,
	[MNO] [varchar](50) NULL,
	[CompanyName] [varchar](50) NULL,
	[RefNo] [varchar](50) NOT NULL,
	[RefID] [varchar](50) NULL,
	[LastUpdated] [datetime] NULL,
 CONSTRAINT [PK_Momo_Loan_Repayment] PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOMO_RESPONSE_LOG]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOMO_RESPONSE_LOG](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[TYPE] [varchar](50) NULL,
	[TXNID] [varchar](50) NULL,
	[AMOUNT] [decimal](18, 0) NULL,
	[MSISDN] [varchar](50) NULL,
	[MNO] [varchar](50) NULL,
	[RESULT] [nchar](10) NOT NULL,
	[ERRORCODE] [varchar](20) NULL,
	[ERRORDESCRIPTION] [varchar](50) NULL,
	[FLAG] [nchar](10) NULL,
	[CONTENT] [varchar](300) NULL,
	[LastUpdated] [datetime2](0) NULL,
	[RefNo] [varchar](50) NULL,
 CONSTRAINT [PK_MOMO_RESPONSE_LOG] PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionLogs]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionLogs](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionType] [varchar](10) NULL,
	[MNO] [varchar](50) NULL,
	[RefNo] [varchar](50) NULL,
	[AccountNo] [varchar](50) NULL,
	[Amount] [decimal](18, 0) NULL,
	[TransactionID] [varchar](50) NULL,
	[ResponseMessage] [varchar](100) NULL,
	[TransactionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TransactionLogs] PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClientSecurity] ADD  CONSTRAINT [DF_ClientAPIKeys_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ClientSecurity] ADD  CONSTRAINT [DF_ClientAPIKeys_APIKEY]  DEFAULT (newid()) FOR [ClientApiKey]
GO
ALTER TABLE [dbo].[ClientSecurity] ADD  CONSTRAINT [DF_ClientAPIKeys_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ClientSecurity] ADD  CONSTRAINT [DF_ClientSecurity_ExpirationDate]  DEFAULT (getdate()+(1)) FOR [ExpirationDate]
GO
/****** Object:  StoredProcedure [dbo].[usp_Add_LoanRepayment]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE proc [dbo].[usp_Add_LoanRepayment]
		   @RefNo  VARCHAR(50)
		  ,@B_AccountNumber VARCHAR(50)=''
		  ,@MomoNumber VARCHAR(50)=''
		  ,@MNO VARCHAR(50)
		  ,@Amount decimal(18,2)
	 
as
INSERT INTO Loan_Repayment
		( [RefNo]
		  ,[B_AccountNumber]
		  ,[MomoNumber]
		  ,[MNO]
		  ,[Amount]		 
		  ,[LastUpdated])
VALUES			
		( @RefNo
		  ,@B_AccountNumber
		  ,@MomoNumber
		  ,@MNO
		  ,@Amount
		  ,GETDATE() )
GO
/****** Object:  StoredProcedure [dbo].[usp_AuthenticateKey]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE proc [dbo].[usp_AuthenticateKey]
@apikey varchar(max)='742EEC5C-F46C-452D-86AF-19EA15E2FE5D'
--,@clientname varchar(200)='CompanyName'
as

SELECT  [EntryID]
      ,[DateCreated]
      ,[ClientApiKey]
      ,[IsActive]
      ,[ApiClientName]
      ,[ExpirationDate]
  FROM [dbo].[ClientSecurity]
  WHERE ClientApiKey =@apikey --and ApiClientName =@clientname
GO
/****** Object:  StoredProcedure [dbo].[usp_Bank_LoanRepayment]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_Bank_LoanRepayment]
		   @RefNo  VARCHAR(50)
		  ,@B_AccountNumber VARCHAR(50)=''		  
		  ,@Amount decimal(18,2)	
		  ,@TransactionID VARCHAR(50) 
as
INSERT INTO Bank_Loan_Repayment
		( [RefNo]
		  ,[B_AccountNumber]		 
		  ,[Amount]	
		  ,[TransactionID]	 
		  ,[LastUpdated])
VALUES			
		( @RefNo
		  ,@B_AccountNumber		  
		  ,@Amount
		  ,@TransactionID
		  ,GETDATE() );
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateLoanRequest]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE proc [dbo].[usp_CreateLoanRequest]
	@RequestID INT =-1,
	@FullName varchar(50),
	@RequestAmount varchar(50),
	@SectorID varchar(50),
	@ContactNumber varchar(50),
	@Location varchar(50),
	@NearestLandmark varchar(50),
	@DistributionMode varchar(50),
	@MNO varchar(50),
	@MomoNumber varchar(50),
	@BankAccountNumber varchar(50),
	@RequestDate date,
	@Comments varchar(50)=''
AS 
UPDATE LoanApplication
	SET FullName = @FullName, 
		RequestAmount = @RequestAmount, 
		SectorID = @SectorID, 
		ContactNumber = @ContactNumber, 
		[Location] = @Location, 
		NearestLandmark = @NearestLandmark, 
		DistributionMode = @DistributionMode, 
		MNO = @MNO, 
		MomoNumber = @MomoNumber, 
		BankAccountNumber = @BankAccountNumber, 
		Comments = @Comments
WHERE RequestID =@RequestID
IF @@ROWCOUNT=0
BEGIN
INSERT INTO LoanApplication
     (FullName, RequestAmount, SectorID, ContactNumber, [Location], NearestLandmark, DistributionMode, MNO, MomoNumber, BankAccountNumber, RequestDate, Comments)
VALUES (@FullName,@RequestAmount,@SectorID,@ContactNumber,@Location,@NearestLandmark,@DistributionMode,@MNO,@MomoNumber,@BankAccountNumber,GetDate(),@Comments )
     
END

 
GO
/****** Object:  StoredProcedure [dbo].[usp_Get_Bank_Transaction_RefNo]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
create proc [dbo].[usp_Get_Bank_Transaction_RefNo] 
@refNo varchar(50)
as
SELECT * FROM [dbo].Bank_Loan_Repayment
where RefNo=@refNo

		
GO
/****** Object:  StoredProcedure [dbo].[usp_Get_LoanOutStandingBalance]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
create proc [dbo].[usp_Get_LoanOutStandingBalance]
@accountnumber varchar(50)
as
SELECT
		[Account_Number]
      ,[Account_Name]
      ,[Balance]
  FROM [dbo].[Loan_Outstanding_3]
  WHERE Account_Number=@accountnumber
GO
/****** Object:  StoredProcedure [dbo].[usp_Get_Momo_Transaction_RefNo]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
create proc [dbo].[usp_Get_Momo_Transaction_RefNo] 
@refNo varchar(50)
as
SELECT * FROM [dbo].Momo_Loan_Repayment
where RefNo=@refNo

		
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAll_LoanOutStandingBalance]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
create proc [dbo].[usp_GetAll_LoanOutStandingBalance]
as
SELECT
		[Account_Number]
      ,[Account_Name]
      ,[Balance]
  FROM [dbo].[Loan_Outstanding_3]
GO
/****** Object:  StoredProcedure [dbo].[usp_LogTransaction]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE proc [dbo].[usp_LogTransaction]

@TransactionType VARCHAR(20)='momo',
@RefNo varchar(50)='',
@AccountNo varchar(50)='',
@Amount decimal(8,2),
@TransactionID varchar(50)='',
@MNO varchar(50)='',
@ResponseMessage varchar(100)=''
as
INSERT INTO TransactionLogs
            (TransactionType,MNO, RefNo, AccountNo, Amount, TransactionID,ResponseMessage, TransactionDate)
VALUES		(@TransactionType,@MNO,@RefNo,@AccountNo,@Amount,@TransactionID,@ResponseMessage,GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[usp_Momo_LoanRepayment]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE proc [dbo].[usp_Momo_LoanRepayment]
		   @RefNo  VARCHAR(50)		 
		  ,@MomoNumber VARCHAR(50)=''
		  ,@MNO VARCHAR(50)='MNO'
		  ,@Amount decimal(18,2)
		  ,@TransactionID VARCHAR(50)=''
		  ,@Type varchar(50) ='BILLPAY'
		  ,@CompanyName varchar(50)=''
		  ,@ReferenceID varchar(50) =''
		as
		INSERT INTO Momo_Loan_Repayment
				( [RefNo]		 
				  ,[MomoNumber]
				  ,[MNO]
				  ,[Amount]	
				  ,[TransactionID]	 
				  ,[Type]
				  ,[CompanyName]
				  ,RefID
				  ,[LastUpdated])
		VALUES			
				( @RefNo		  
				  ,@MomoNumber
				  ,@MNO
				  ,@Amount
				  ,@TransactionID
				  ,@Type
				  ,@CompanyName
				  ,@ReferenceID
				  ,GETDATE() )
GO
/****** Object:  StoredProcedure [dbo].[usp_SaveTransactionLog]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_SaveTransactionLog]
			@TYPE [varchar](50),
			@TXNID [varchar](50),	
			@MSISDN [varchar](50),
			@MNO [varchar](10)='MNO',
			@RESULT [varchar](50),
			@ERRORCODE [varchar](20),
			@ERRORDESCRIPTION [varchar](100),
			@FLAG[Nchar](10),
			@CONTENT [varchar](100),
			@AMOUNT decimal =0
		   as
	INSERT INTO
			 [dbo].[MOMO_RESPONSE_LOG]          
             ([TYPE], TXNID, MSISDN, MNO, RESULT, ERRORCODE, FLAG, ERRORDESCRIPTION,[CONTENT], AMOUNT,LastUpdated)
	VALUES   (@TYPE, @TXNID,@MSISDN,@MNO,@RESULT,@ERRORCODE,@FLAG,@ERRORDESCRIPTION,@CONTENT, @AMOUNT,GETDATE())


	
	
GO
/****** Object:  StoredProcedure [dbo].[usp_validateCustomerRefernceID]    Script Date: 8/20/2020 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

	CREATE proc [dbo].[usp_validateCustomerRefernceID]
	@RefNo VARCHAR(50)='12345678912'
	
	AS
	 declare @outputValue int;  
	     
	 SELECT @outputValue = COUNT(Account_Number)  
	 FROM [dbo].[vwCustomersLoanOutstanding] 
	 where Account_Number = @RefNo;

	return @outputValue
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bank Account Number or Momo Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionLogs', @level2type=N'COLUMN',@level2name=N'AccountNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Loan_Outstanding_3"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwCustomersLoanOutstanding'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwCustomersLoanOutstanding'
GO
