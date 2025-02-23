package com.example.lemonade

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.wrapContentSize
import androidx.compose.material3.Button
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import com.example.lemonade.ui.theme.LemonadeTheme
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            LemonadeTheme {
                LemonadeApp()
            }
        }
    }
}

@Composable
fun LemonadeAction(modifier: Modifier = Modifier) {
    val lemon_tree = stringResource(R.string.text1)
    val lemon_squeeze = stringResource(R.string.text2)
    val lemon_drink = stringResource(R.string.text3)
    val lemon_restart = stringResource(R.string.text4)

    var step by remember { mutableIntStateOf(0) }
    val imageResource = when (step) {
        0 -> R.drawable.lemon_tree
        1 -> R.drawable.lemon_squeeze
        2 -> R.drawable.lemon_drink
        else -> R.drawable.lemon_restart
    }
    val text = when (step) {
        0 -> lemon_tree
        1 -> lemon_squeeze
        2 -> lemon_drink
        else -> lemon_restart
    }

    Column (
        modifier = Modifier
            .fillMaxSize()
            .wrapContentSize(Alignment.Center), // Đảm bảo nội dung nằm giữa
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Button(onClick = { step = (step + 1) % 4 },
            modifier = Modifier
            .wrapContentSize(Alignment.Center) ) {
            Image(
                painter = painterResource(imageResource),
                contentDescription = text.toString(),
            )
        }
        Spacer(modifier = Modifier.height(35.dp))
        Text(
            text = text,
            fontSize = 21.sp
        )
    }
}

@Preview(showBackground = true)
@Composable
fun LemonadeApp() {
    LemonadeAction(
        modifier = Modifier.fillMaxSize()
    )
}