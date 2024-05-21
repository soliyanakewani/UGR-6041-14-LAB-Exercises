package com.example.jetpack

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.Image
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.jetpack.ui.theme.JetPackTheme


object SampleData {
    val conversationSample = listOf(
        Message("Lexi", "Hey, take a look at Jetpack Compose, it's great!"),
        Message("Paul", "Here's another message to check out."),
        Message("John", "Jetpack Compose simplifies UI development."),
        Message("Ana", "Kotlin is an amazing language for Android development."),
        // Add more sample messages if needed
    )
}



class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            JetPackTheme { // Changed theme name to JetPackTheme
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                        Conversation(
                            messages = SampleData.conversationSample,
                            modifier = Modifier.padding(innerPadding))
                    }
                }
            }
        }
    }
data class Message(val author: String, val body: String)


@Composable
fun Conversation(messages: List<Message>, modifier: Modifier= Modifier) {
    LazyColumn (modifier = modifier){
        items(messages) { message ->
            MessageCard(message)
        }
    }
}

@Composable
fun MessageCard(msg: Message) {
    Row(modifier = Modifier.padding(all = 8.dp)) {
        Image(
            painter = painterResource(R.drawable.profile_picture),
            contentDescription = null,
            modifier = Modifier
                .size(40.dp)

                .border(1.5.dp, MaterialTheme.colorScheme.primary, CircleShape)
        )

        Spacer(modifier = Modifier.width(8.dp))

        Column {
            Text(
                text = msg.author,
                color = MaterialTheme.colorScheme.secondary
            )

            Spacer(modifier = Modifier.height(4.dp))
            Text(text = msg.body)
        }
    }
}


@Preview(showBackground = true)
@Composable
fun PreviewConversation() {
    JetPackTheme { // Changed theme name to JetPackTheme
        Conversation(SampleData.conversationSample)
    }
}
