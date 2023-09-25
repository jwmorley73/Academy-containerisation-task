""" Database managing rebel communications
"""
import typing


messages: typing.Dict[str, str] = {
    "82c3ded9-2a2f-483a-980a-820485d23862": """
        Subject: Urgent: Relocation Required
        From: Alpha Leader
        To: Bravo Rebel Cell
        
        Bravo,
        
        Imperial forces closing in. New rendezvous coordinates attached. Stay alert. May the Force be with us.
        """,

    "46245131-7c14-4faa-9d0c-3f7a0701d193": """
        Subject: Supply Depot Threat
        From: Echo Scout
        To: Foxtrot Rebel Cell
        
        Foxtrot,
        
        Intercepted comms hint at Imperial raid on our depot. Need reinforcements now. Depot location sent. Hurry!
        """,

    "3287056b-9a5d-406f-b2ca-1fc94ade133d": """
        Subject: Security Alert
        From: Delta Commander
        To: Gamma Rebel Cell
        
        Gamma,
        
        Intel warns of possible informant. Investigate quietly. Report any suspicions. Trust no one.
        """,

    "3399d51f-12dd-4116-bf9a-f0c12af256b9": """
        Subject: Imperial Fleet Intel
        From: Zeta Tech Specialist
        To: Omega Rebel Cell
        
        Omega,
        
        Decrypted Imperial codes reveal fleet movements. Share wisely. A potential game-changer.
        """,

    "4db05a51-e612-4834-86ea-3e74a86c30f5": """
        Subject: High-Value Target
        From: Charlie Infiltrator
        To: Tango Rebel Cell
        
        Tango,
        
        Identifying a vital Imperial target. Preparing extraction op. Await further instructions. Time to strike back.
        """
}
"Database containing latest rebel communications"
