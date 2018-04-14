/*
 * Copyright (C) 2014 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _BDROID_BUILDCFG_H
#define _BDROID_BUILDCFG_H

#define BTM_DEF_LOCAL_NAME "Mad Catz M.O.J.O."

// SERVICE_CLASS:(Bit17 -Networking,Bit19 - Capturing,Bit20 -Object Transfer)
// MAJOR CLASS: COMPUTER
// MINOR CLASS: PALM SIZE PC/PDA
#define BTA_DM_COD {0x1A, 0x01, 0x14}

#define BLE_VND_INCLUDED TRUE

// Turn off BLE_PRIVACY_SPT.  Remote reconnect fails on
// often if this is enabled.
#define BLE_PRIVACY_SPT FALSE

// Force connection interval to 13.75ms
#define BTM_BLE_CONN_INT_MIN_DEF 11 /* 13.75ms = 11 * 1.25 */
#define BTM_BLE_CONN_INT_MAX_DEF BTM_BLE_CONN_INT_MIN_DEF

// Allow better battery life
#define BTM_BLE_CONN_SLAVE_LATENCY_DEF 24

// Detect disconnects faster
#define BTM_BLE_CONN_TIMEOUT_DEF 300

// Increase background scanning to reduce reconnect time
#define BTM_BLE_SCAN_SLOW_INT_1    110    /* 68.75 ms   = 110 *0.625 */
#define BTM_BLE_SCAN_SLOW_WIN_1    8      /* 5 ms = 8 *0.625 */

// Disable HFP
#define BTIF_HF_SERVICES (BTA_HSP_SERVICE_MASK)
#define BTIF_HF_SERVICE_NAMES  { BTIF_HSAG_SERVICE_NAME, NULL }

// Disable compiling code in Bluedroid for profiles we don't support
#define BTA_PAN_INCLUDED FALSE
#define BNEP_INCLUDED FALSE
#define AVDT_INCLUDED FALSE
#define PAN_INCLUDED FALSE
#define AVCT_INCLUDED FALSE

// Change I/O capabilities to output only so pairing uses passkey instead of pin
#define BTM_LOCAL_IO_CAPS BTM_IO_CAP_OUT

#endif
