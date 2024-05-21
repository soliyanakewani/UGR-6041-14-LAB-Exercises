import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp


class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            JetpackComposeCounterApp()
        }
    }
}

@Composable
fun JetpackComposeCounterApp() {
    var count by remember { mutableStateOf(0) }

    Column(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = "Count: $count",
//            style = MaterialTheme.typography
        )

        Spacer(modifier = Modifier.height(16.dp))

        Row {
            CounterButton(
                text = "Increment",
                onClick = { count++ }
            )

            Spacer(modifier = Modifier.width(16.dp))

            CounterButton(
                text = "Decrement",
                onClick = { count-- }
            )
        }

        Spacer(modifier = Modifier.height(16.dp))

        CounterButton(
            text = "Reset",
            onClick = { count = 0 }
        )
    }
}

@Composable
fun CounterButton(text: String, onClick: () -> Unit) {
    Button(
        onClick = onClick,
        modifier = Modifier.width(120.dp)
    ) {
        Text(text = text)
    }
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    JetpackComposeCounterApp()
}
